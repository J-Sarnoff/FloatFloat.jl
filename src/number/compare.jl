
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

