
isnan(a::DD)        = isnan(a.hi)
isinf(a::DD)        = isinf(a.hi)
isfinite(a::DD)     = isfinite(a.hi)
issubnormal(a::DD)  = issubnormal(a.hi)

iszero(a::DD)       = (a.hi == zero(typeof(a.hi)))
ispos(a::DD)        = (a.hi >= zero(typeof(a.hi)))
ispoz(a::DD)        = !signbit(a.hi)
isneg(a::DD)        = signbit(a.hi)
