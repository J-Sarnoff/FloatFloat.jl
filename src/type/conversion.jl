
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

for T in (:Float64, :Float32, :Float16, :Int64, :Int32, :Int16)
   @eval promote_rule(::Type{DD}, ::Type{($T)}) = DD
end
promote_rule{I<:Irrational}(::Type{DD}, ::Type{I}) = DD

