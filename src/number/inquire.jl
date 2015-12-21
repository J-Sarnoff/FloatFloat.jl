
zero(::Type{FF}) = FF(zero(Float64),zero(Float64))
zero(a::FF)      = zero(FF)
one(::Type{FF})  = FF(one(Float64),zero(Float64))
one(a::FF)       = one(FF)


isnan(a::FF)        = isnan(a.hi)
isinf(a::FF)        = isinf(a.hi)
isfinite(a::FF)     = isfinite(a.hi)
issubnormal(a::FF)  = issubnormal(a.hi)

iszero(a::FF)       = (a.hi == zero(typeof(a.hi)))
ispos(a::FF)        = (a.hi >= zero(typeof(a.hi)))
ispoz(a::FF)        = !signbit(a.hi)                   # positive or zero, nonnegative
isneg(a::FF)        = signbit(a.hi)
