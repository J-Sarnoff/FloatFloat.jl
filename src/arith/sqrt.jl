
#=
          DoubleDouble Floating Point Arithmetic
             Jeffrey Sarnoff   19 Dec 2015     
=#

module DoubDouble


# import
import Base: convert, promote_rule,
             zero, one, isinf, isnan, isfinite,
             (-), abs, sign, signbit, copysign, flipsign,
             isequal, isless, (<),(<=),(==),(>=),(>),
             (+),(*),(/),(\), fma,
             round, floor, ceil, trunc, fld, cld,
             ldexp, frexp, modf,
             div, rem, divrem, mod, fldmod, (%),
             sqrt, hypot, (^),
             exp, log, log2, log10, expm1, log1p,
             sin, cos, tan, csc, sec, cot,
             sinh, cosh, tanh, csch, sech, coth,
             asin, acos, atan, acsc, asec, acot, atan2,
             asinh, acosh, atanh, acsch, asech, acoth,
             string, show, showcompact, parse, hex

# export
export DoubDoub, DD, clean,
       hilo, nearest2



@inline function eftSquare(a::Float64)
    x = a * a
    y = fma(a, a, -x)
    x,y
end

function eftCube(a::Float64)
    p = a*a; e = fma(a, a, -p)
    x = p*a; p = fma(p, a, -x)
    y = e*a
    x,y
end

# sassafrass! 'y' must be negated to get the right result
#
@inline function eftRecip(a::Float64)
     x = one(Float64)/a
     y = -(fma(x,a,-1.0)/a)
     x,y
end

#=
   While not strictly an error-free transformation it is quite reliable and recommended for use.
   Augmented precision square roots, 2-D norms and discussion on correctly reounding sqrt(x^2 + y^2)
   by Nicolas Brisebarre, Mioara Joldes, Erik Martin-Dorel, Hean-Michel Muller, Peter Kornerup
=#
@inline function eftSqrt(a::Float64)
     x = sqrt(a)
     t = fma(x,-x,a)
     y = t / (x*2.0)
     x,y
end     
     
@inline function eftRecipSqrt(a::Float64)
     r = 1.0/a
     x = sqrt(r)
     t = fma(x,-x,r)
     y = t / (x*2.0)
     x,y
end


@inline function eftSum2{T<:Float64}(a::T, b::T)
  x = a + b
  t = x - a
  y = (a - (x - t)) + (b - t)
  x,y
end


@inline function eftSum2inOrder{T<:Float64}(a::T, b::T)
  x = a + b
  y = b - (x - a)
  x,y
end


@inline function eftDiff2{T<:Float64}(a::T, b::T)
  x = a - b
  t = x - a
  y = (a - (x - t)) - (b + t)
  x,y
end


@inline function eftDiff2inOrder{T<:Float64}(a::T, b::T)
  x = a - b
  y = (a - x) - b
  x,y
end

@inline function eftProd2{T<:Float64}(a::T, b::T)
    x = a * b
    y = fma(a, b, -x)
    x,y
end

# sassafrass!  'y' must be negated to get the right result
#
@inline function eftDiv2{T<:Float64}(a::T,b::T)
     x = a/b
     y = -(fma(x,b,-a)/b)
     x,y
end

  function eftSum3{T<:Float64}(a::T,b::T,c::T)
    s,t = eftSum2(b, c)
    x,u = eftSum2(a, s)
    y,z = eftSum2(u, t)
    x,y = eftSum2inOrder(x, y)
    x,y,z
end

function eftSum3inOrder{T<:Float64}(a::T,b::T,c::T)
    s,t = eftSum2inOrder(b, c)
    x,u = eftSum2inOrder(a, s)
    y,z = eftSum2inOrder(u, t)
    x,y = eftSum2inOrder(x, y)
    x,y,z
end

@inline function eftSum3as2{T<:Float64}(a::T,b::T,c::T)
    s,t = eftSum2(b, c)
    x,u = eftSum2(a, s)
    y = u+t
    x,y = eftSum2inOrder(x, y)
    x,y
end

@inline function eftSum3inOrderAs2{T<:Float64}(a::T,b::T,c::T)
    s,t = eftSum2inOrder(b, c)
    x,u = eftSum2inOrder(a, s)
    y = u+t
    x,y = eftSum2inOrder(x, y)
    x,y
end

function eftProd3{T<:Float64}(a::T, b::T, c::T)
    p,e = eftProd2(a,b)
    x,p = eftProd2(p,c)
    y,z = eftProd2(e,c)
    x,y,z
end

@inline function eftProd3as2{T<:Float64}(a::T, b::T, c::T)
    p,e = eftProd2(a,b)
    x,p = eftProd2(p,c)
    y = e*c
    x,y
end


typealias SignedInt Union{Int32,Int64}



    
#=
The internal structure is 128 bits given as a magnitude-ordered pair of Float64 values.
The pair are *presumed* to be in cannonical form, where they do not overlap: hi⊕lo ≡ hi.
This representation is known as "double-double" (see refs.md)
=#

immutable DD <: Real
    hi::Float64
    lo::Float64
end

typealias DoubDoub DD

DD(a::Float64) = DD(a,zero(Float64))
DD{T<:Float64}(a::Tuple{T}) = DD(a[1])
DD{T<:Float64}(a::Tuple{T,T}) = DD(a[1],a[2])



# idempotency
convert(::Type{DD}, x::DD) = x

# ambiguity reduction: first specify interconversion with Bool
convert(::Type{DD}, x::Bool) = convert(DD, convert(Float64,x))
convert(::Type{Bool}, x::DD) = ((x.hi != 0.0) | (x.lo != 0.0))
promote_rule(::Type{DD}, ::Type{Bool}) = DD

# ambiguity resolution: specify interconversion with Float64
convert(::Type{DD}, x::Float64) = DD(x,0.0)
convert(::Type{Float64}, x::DD) = x.hi
function convert(::Type{DD}, x::Float64, y::Float64)
    hi,lo = eftSum2(x,y)
    DD(hi,lo)
end
promote_rule(::Type{DD}, ::Type{Float64}) = DD

# autoprocessable types
for T in (:Int16, :Int32, :Int64, :Float16, :Float32,
          :(Rational{Int32}), :(Rational{Int64}))
    @eval begin
        convert(::Type{DD}, x::($T)) = convert(DD, convert(Float64,x))
        convert(::Type{$T}, x::DD) = convert(($T), DD.hi)
        promote_rule(::Type{DD}, ::Type{$T}) = DD
    end
end


# special numerical types
convert(::Type{BigFloat}, a::AbstractString) = parse(BigFloat, a)
convert{I<:Integer}(::Type{BigFloat}, a::I) = convert(BigFloat, string(a))
convert{I<:Integer}(::Type{BigFloat}, a::Rational{I}) = 
    convert(BigFloat,convert(BigInt,num(a))) / convert(BigFloat,convert(BigInt, den(a)))

convert{S<:Symbol}(::Type{DD}, x::Irrational{S}) = convert(DD, convert(BigFloat,x))
DD{I<:Irrational}(x::I) = convert(DD, convert(BigFloat,x))
promote_rule{S<:Symbol}(::Type{DD}, ::Type{Irrational{S}}) = DD

# delegation with non-leaf types
convert(::Type{DD}, x::Integer) = convert(DD, convert(Float64, convert(Int64,x)))
convert(::Type{DD}, x::AbstractFloat) = convert(DD, convert(Float64,x))
convert(::Type{Integer}, x::DD) = convert(Int64, x.hi) + trunc(Int64, trunc(x.lo))
convert(::Type{AbstractFloat}, x::DD) = x.hi
promote_rule(::Type{DD}, ::Type{Integer}) = DD
promote_rule(::Type{DD}, ::Type{AbstractFloat}) = DD

convert(::Type{DD}, a::Tuple{Float64}) = DD(a[1])
convert(::Type{DD}, a::Tuple{Float64,Float64}) = DD(a[1],a[2])
convert(::Type{Tuple}, a::DD) = (a.hi,a.lo)
convert(::Type{Tuple{Float64,Float64}}, a::DD) = (a.hi,a.lo)

convert{T<:Signed}(::Type{DD}, a::Rational{T}) = convert(BigFloat, a)

  
function convert(::Type{DD}, a::BigFloat)
   hi = convert(Float64, a)
   hs = parse(BigFloat,string(hi))
   lo = convert(Float64, (a-hs))
   DD(hi,lo)
end   
convert(::Type{BigFloat}, a::DD) = parse(BigFloat,string(a.hi)) + parse(BigFloat,string(a.lo))
convert(::Type{DD}, a::AbstractString) = convert(DD, convert(BigFloat,a))
convert{I<:Integer}(::Type{DD}, a::Rational{I}) = 
    convert(DD, convert(BigFloat,a))

convert{I<:BigInt}(::Type{Rational{I}}, a::DD)    = 
    convert(Rational{I},convert(BigFloat,a))
convert{I<:SignedInt}(::Type{Rational{I}}, a::DD) = 
    trunc(T, convert(BigFloat, convert(Rational{BigInt}, a)))

convert{I<:Irrational}(::Type{DD}, x::I) = convert(DD, convert(BigFloat,x))

convert{T<:DD}(::Type{AbstractFloat}, a::T) = a.hi
convert{T<:DD}(::Type{Integer}, a::T) = convert(Int64, a.hi) + trunc(Int64, a.hi)
 
promote_rule(::Type{DD}, ::Type{Float64}) = DD
promote_rule(::Type{DD}, ::Type{Float32}) = DD
promote_rule(::Type{DD}, ::Type{Int64}) = DD
promote_rule(::Type{DD}, ::Type{Int32}) = DD
promote_rule{I<:Irrational}(::Type{DD}, ::Type{I}) = DD





const epseps1 = eps(eps(1.0))

function clean(x::DD)
    if (abs(x.hi) <= epseps1)
        zero(DD)
    elseif (abs(x.lo) <= eps(eps(x.hi)))
        DD(x.hi,0.0)
    else
        x
    end
end

clean(v::Vector{DD}) = [clean(x) for x in v]
clean(m::Matrix{DD}) = reshape([clean(x) for x in m],size(m))
clean(a::Array{DD}) = reshape([clean(x) for x in a],size(a))


zero(::Type{DD}) = DD(zero(Float64),zero(Float64))
zero(a::DD)      = zero(DD)
one(::Type{DD})  = DD(one(Float64),zero(Float64))
one(a::DD)       = one(DD) 

sign(a::DD)    = sign(a.hi)
signbit(a::DD) = signbit(a.hi)

(-)(a::DD)   = DD(-a.hi,-a.lo)
(abs)(a::DD) = (a.hi >= zero(Float64) ? a : -a)

@inline flipsign(a::DD,b::DD) = DD(flipsign(a.hi,b.hi), flipsign(a.lo,b.hi))
@inline flipsign(a::DD,b::Float64) = DD(flipsign(a.hi,b), flipsign(a.lo,b))
@inline flipsign(a::DD,b::Integer) = DD(flipsign(a.hi,b), flipsign(a.lo,b))

@inline function copysign(a::DD,b::Float64)
    if (b < zero(Float64))
        a.hi < zero(Float64) ? a : -a
    else
        a.hi < zero(Float64) ? -a : a
    end
end
@inline copysign(a::DD,b::Integer) = copysign(a,convert(Float64,b))
@inline copysign(a::DD,b::DD) = copysign(a,b.hi)

# predicates

isnan(a::DD)        = isnan(a.hi)
isinf(a::DD)        = isinf(a.hi)
isfinite(a::DD)     = isfinite(a.hi)
issubnormal(a::DD)  = issubnormal(a.hi)

iszero(a::DD)       = (a.hi == zero(typeof(a.hi)))
ispos(a::DD)        = (a.hi >= zero(typeof(a.hi)))
ispoz(a::DD)        = !signbit(a.hi)
isneg(a::DD)        = signbit(a.hi)

# comparatives

@inline function isless(a::DD, b::DD)
    (a.hi < b.hi) || (a.hi==b.hi && a.lo<b.lo)
end
@inline function isless(a::DD, b::Float64)
    (a.hi < b) || (a.hi==b && a.lo<zero(Float64))
end
@inline function isless(a::Float64, b::DD)
    (a < b.hi) || (a==b.hi && b.lo<zero(Float64))
end
@inline function isequal(a::DD, b::DD)
    (a.hi == b.hi) && (a.lo == b.lo)
end
@inline function isequal(a::DD, b::Float64)
    (a.hi == b) && (a.lo == zero(Float64))
end
@inline function isequal(a::Float64, b::DD)
    (a == b.hi) && (b.lo == zero(Float64))
end

@inline (==)(a::DD,b::DD) = (a.hi == b.hi) && (a.lo == b.lo)
@inline (< )(a::DD,b::DD) = (a.hi < b.hi) || (a.hi==b.hi && a.lo<b.lo)
@inline (<=)(a::DD,b::DD) = (a.hi < b.hi) || (a.hi==b.hi && a.lo<=b.lo)
@inline (> )(a::DD,b::DD) = (a.hi > b.hi) || (a.hi==b.hi && a.lo>b.lo)
@inline (>=)(a::DD,b::DD) = (a.hi > b.hi) || (a.hi==b.hi && a.lo>=b.lo)


function frexp(a::DD)
    frhi, xphi = frexp(a.hi)
    frlo, xplo = frexp(a.lo)
    DD(frhi, ldexp(frlo,xplo-xphi)), xphi
end

function ldexp(a::DD,xp::Int)
    DD(ldexp(a.hi,xp),ldexp(a.lo,xp))
end
ldexp{I<:Integer}(fx::Tuple{DD,I}) = ldexp(fx...)

for (fn) in (:floor, :ceil, :round)
  @eval begin
    function ($fn)(a::DD)
        hi = ($fn)(a.hi)
        lo = 0.0
        if (hi == a.hi)
            lo = ($fn)(a.lo)
            hi,lo = eftSum2inOrder(hi,lo)
        end
        DD(hi,lo)
    end    
  end        
end

function (trunc)(a::DD)
    a.hi >= zero(Float64) ? floor(a) : ceil(a)
end

"""
stretch is the opposite of trunc()
it extends to the nearest integer away from zero
"""
function (stretch)(a::DD)
    a.hi >= zero(Float64) ? ceil(a) : floor(a)
end
# addition

function (+){T<:DD}(a::T,b::T)
    s1, s2 = eftSum2(a.hi,b.hi)
    t1, t2 = eftSum2(a.lo,b.lo)
    s2 += t1
    s1, s2 = eftSum2inOrder(s1,s2)
    s2 += t2
    s1, s2 = eftSum2inOrder(s1,s2)
    DD(s1,s2)
end

function (+)(a::DD,b::Float64)
    s1, s2 = eftSum2(a.hi,b)
    s2 += a.lo
    s1, s2 = eftSum2inOrder(s1,s2)
    DD(s1,s2)
end

(+)(a::Float64,b::DD) = (+)(b,a)
(+)(a::DD,b::Signed) = (+)(a,convert(Float64,b))
(+)(a::Signed,b::DD) = (+)(b,a)

# subtraction

function (-){T<:DD}(a::T,b::T)
    s1, s2 = eftDiff2(a.hi,b.hi)
    t1, t2 = eftDiff2(a.lo,b.lo)
    s2 += t1
    s1, s2 = eftSum2inOrder(s1,s2)
    s2 += t2
    s1, s2 = eftSum2inOrder(s1,s2)
    DD(s1,s2)
end

function (-)(a::DD,b::Float64)
    s1, s2 = eftDiff2(a.hi,b)
    s2 += a.lo
    s1, s2 = eftSum2inOrder(s1,s2)
    DD(s1,s2)
end

function (-)(a::Float64,b::DD)
    s1, s2 = eftDiff2(a,b.hi)
    s2 -= b.lo
    s1, s2 = eftSum2inOrder(s1,s2)
    DD(s1,s2)
end

(-)(a::DD,b::Signed) = (-)(a,convert(Float64,b))
(-)(a::Signed,b::DD) = (-)(convert(Float64,a),b)

# multiplication


function (sqr)(a::DD)
  t1,t2 = eftProd2(a.hi,a.hi)
  t3 = a.hi * a.lo
  t5 = t3 + t3
  t6 = t2 + t5
  t1,t6 = eftSum2inOrder(t1,t6)
  DD(t1,t6)
end

function (*){T<:DD}(a::T,b::T)
  t1,t2 = eftProd2(a.hi,b.hi)
  t3 = a.hi * b.lo
  t4 = a.lo * b.hi
  t5 = t3 + t4
  t6 = t2 + t5
  t1,t6 = eftSum2inOrder(t1,t6)
  DD(t1,t6)
end

function (*)(a::DD,b::Float64)
  t1,t2 = eftProd2(a.hi,b)
  t4 = a.lo * b
  t6 = t2 + t4
  t1,t6 = eftSum2inOrder(t1,t6)
  DD(t1,t6)
end

(*)(a::Float64,b::DD) = (*)(b,a)
(*)(a::DD,b::Signed) = (*)(a,convert(Float64,b))
(*)(a::Signed,b::DD) = (*)(convert(Float64,a),b)



# division

function (/){T<:DD}(a::T,b::T)
  q1 = a.hi / b.hi
  r  = a - (q1 * b)

  q2 = r.hi / b.hi
  r = r - (q2 * b)

  q3 = r.hi / b.hi

  q1,q2 = eftSum2inOrder(q1, q2)
  q1,q2 = eftSum3as2(q1,q2,q3)
  DD(q1,q2)
end

# powers


# roots

function sqrt(a::DD)
    if a.hi <= zero(Float64)
       if a.hi == zero(Float64)
           return zero(DD)
       else
           throw(ArgumentError("sqrt expects a nonnegative base"))
       end
    #elseif (a.hi < 1.0e-18) | (a.hi > 1.0e18)
    #    throw(ArgumentError("sqrt arg ($a) outside domain"))
    end

    if (a.hi < 1.0e-7)  # -log2(1.0e-7) < (1/2) Float64 significand bits
        return one(DD) / sqrt(one(DD)/a)
    end

    # initial approximation to 1/sqrt(a)
    r = DD(one(Float64)/sqrt(a.hi), zero(Float64))

    r = r + divby2( r * (one(DD) - (a*(r*r))) )
    r = r + divby2( r * (one(DD) - (a*(r*r))) )
    r = r + divby2( r * (one(DD) - (a*(r*r))) )

    r = a*r
    divby2(r + a/r)
end




#=
     for a in [1e-15..1e18]
      relerr ~1.3e-32  (106 bits)
=#
function sqrt(a::DD)
    if a.hi <= zero(Float64)
       if a.hi == zero(Float64)
           return zero(DD)
       else
           throw(ArgumentError("sqrt expects a nonnegative base"))
       end
    elseif (a.hi < 1.0e-18) | (a.hi > 1.0e18)
        throw(ArgumentError("sqrt arg ($a) outside domain"))
    end

    if (a.hi < 1.0e-7)  # -log2(1.0e-7) < (1/2) Float64 significand bits
        return one(DD) / sqrt(one(DD)/a)
    end

    # initial approximation to 1/sqrt(a)
    r = DD(one(Float64)/sqrt(a.hi), zero(Float64))

    r = r + divby2( r * (one(DD) - (a*(r*r))) )
    r = r + divby2( r * (one(DD) - (a*(r*r))) )
    r = r + divby2( r * (one(DD) - (a*(r*r))) )

    r = a*r
    divby2(r + a/r)
end


function hypot(a::DD, b::DD)
    a = abs(a)
    b = abs(b)
    t, x = min(a,b), max(a,b)
    t = t/a
    x * sqrt(1.0 + t*t)
end

