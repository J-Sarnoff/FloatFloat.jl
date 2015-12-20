
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
