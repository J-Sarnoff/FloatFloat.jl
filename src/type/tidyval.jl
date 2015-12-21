
const epseps1 = eps(eps(1.0))

function tidy(x::FF)
    if (abs(x.hi) <= epseps1)
        zero(FF)
    elseif (abs(x.lo) <= eps(eps(x.hi)))
        FF(x.hi,0.0)
    else
        x
    end
end

tidy(v::Vector{FF}) = [tidy(x) for x in v]
tidy(m::Matrix{FF}) = reshape([tidy(x) for x in m],size(m))
tidy(a::Array{FF})  = reshape([tidy(x) for x in a],size(a))

