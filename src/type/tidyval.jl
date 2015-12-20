
const epseps1 = eps(eps(1.0))

function tidy(x::DD)
    if (abs(x.hi) <= epseps1)
        zero(DD)
    elseif (abs(x.lo) <= eps(eps(x.hi)))
        DD(x.hi,0.0)
    else
        x
    end
end

tidy(v::Vector{DD}) = [clean(x) for x in v]
tidy(m::Matrix{DD}) = reshape([tidy(x) for x in m],size(m))
tidy(a::Array{DD})  = reshape([tidy(x) for x in a],size(a))

