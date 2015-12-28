
sign(a::FF)    = sign(a.hi)
signbit(a::FF) = signbit(a.hi)

(-)(a::FF)   = FF(-a.hi,-a.lo)
(abs)(a::FF) = (a.hi >= zero(Float64) ? a : -a)

@inline flipsign(a::FF,b::FF) = FF(flipsign(a.hi,b.hi), flipsign(a.lo,b.hi))
@inline flipsign(a::FF,b::Float64) = FF(flipsign(a.hi,b), flipsign(a.lo,b))
@inline flipsign(a::FF,b::Integer) = FF(flipsign(a.hi,b), flipsign(a.lo,b))

@inline function copysign(a::FF,b::Float64)
    if (b < zero(Float64))
        a.hi < zero(Float64) ? a : -a
    else
        a.hi < zero(Float64) ? -a : a
    end
end
@inline copysign(a::FF,b::Integer) = copysign(a,convert(Float64,b))
@inline copysign(a::FF,b::FF) = copysign(a,b.hi)

eps(::Type{FF}) = 4.930380657631324e-32 # eps(eps(1.0))

function eps(a::FF)
    if a.lo != 0.0
        eps(a.lo)
    elseif a.hi != 0.0
        eps(eps(a.hi)*0.5)
    else
        eps(0.0)
    end
end


ulp(a::AbstractFloat) = eps(a)*0.5
ulp(a::FF) = eps(a)*0.5

function exponent(a::FF)
    if a.lo != 0.0
        exponent(a.lo)
    elseif a.hi != 0.0
        exponent(a.hi)-precision(typeof(a.lo))-1
    else
        exponent(0.0)
    end
end


function frexp(a::FF)
    frhi, xphi = frexp(a.hi)
    frlo, xplo = frexp(a.lo)
    FF(frhi, ldexp(frlo,xplo-xphi)), xphi
end

function ldexp(a::FF,xp::Int)
    FF(ldexp(a.hi,xp),ldexp(a.lo,xp))
end
ldexp{I<:Integer}(fx::Tuple{FF,I}) = ldexp(fx...)


for (fn) in (:floor, :ceil, :round)
  @eval begin
    function ($fn)(a::FF)
        hi = ($fn)(a.hi)
        lo = 0.0
        if (hi == a.hi)
            lo = ($fn)(a.lo)
            hi,lo = eftSum2inOrder(hi,lo)
        end
        FF(hi,lo)
    end
  end
end

function (trunc)(a::FF)
    a.hi >= zero(Float64) ? floor(a) : ceil(a)
end

"""
stretch is the opposite of trunc()
it extends to the nearest integer away from zero
"""
function (stretch)(a::AbstractFloat)
    a.hi >= zero(Float64) ? ceil(a) : floor(a)
end
function (stretch)(a::FF)
    a.hi >= zero(Float64) ? ceil(a) : floor(a)
end
