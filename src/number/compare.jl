
@inline function isless(a::FF, b::FF)
    (a.hi < b.hi) || (a.hi==b.hi && a.lo<b.lo)
end
@inline function isless(a::FF, b::Float64)
    (a.hi < b) || (a.hi==b && a.lo<zero(Float64))
end
@inline function isless(a::Float64, b::FF)
    (a < b.hi) || (a==b.hi && b.lo<zero(Float64))
end
@inline function isequal(a::FF, b::FF)
    (a.hi == b.hi) && (a.lo == b.lo)
end
@inline function isequal(a::FF, b::Float64)
    (a.hi == b) && (a.lo == zero(Float64))
end
@inline function isequal(a::Float64, b::FF)
    (a == b.hi) && (b.lo == zero(Float64))
end

@inline (==)(a::FF,b::FF) = (a.hi == b.hi) && (a.lo == b.lo)
@inline (< )(a::FF,b::FF) = (a.hi < b.hi) || (a.hi==b.hi && a.lo<b.lo)
@inline (<=)(a::FF,b::FF) = (a.hi < b.hi) || (a.hi==b.hi && a.lo<=b.lo)
@inline (> )(a::FF,b::FF) = (a.hi > b.hi) || (a.hi==b.hi && a.lo>b.lo)
@inline (>=)(a::FF,b::FF) = (a.hi > b.hi) || (a.hi==b.hi && a.lo>=b.lo)

