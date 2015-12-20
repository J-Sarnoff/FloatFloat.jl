
zero(::Type{DD}) = DD(zero(Float64),zero(Float64))
zero(a::DD)      = zero(DD)
one(::Type{DD})  = DD(one(Float64),zero(Float64))
one(a::DD)       = one(DD) 


isnan(a::DD)        = isnan(a.hi)
isinf(a::DD)        = isinf(a.hi)
isfinite(a::DD)     = isfinite(a.hi)
issubnormal(a::DD)  = issubnormal(a.hi)

iszero(a::DD)       = (a.hi == zero(typeof(a.hi)))
ispos(a::DD)        = (a.hi >= zero(typeof(a.hi)))
ispoz(a::DD)        = !signbit(a.hi)                   # positive or zero, nonnegative
isneg(a::DD)        = signbit(a.hi)
