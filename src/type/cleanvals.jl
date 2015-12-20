
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

