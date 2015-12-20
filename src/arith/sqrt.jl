
# roots


#=
     for a in [1e-15..1e18]
      relerr ~1.3e-32  (106 bits)
=#
function sqrt(a::DD)
    if a.hi <= zero(Float64)
       if a.hi == zero(Float64)
           return zero(DD)
       else
           throw(ArgumentError("sqrt expects a nonnegative base"))
       end
    elseif (a.hi < 1.0e-18) | (a.hi > 1.0e18)
        throw(ArgumentError("sqrt arg ($a) outside domain"))
    end

    if (a.hi < 1.0e-7)  # -log2(1.0e-7) < (1/2) Float64 significand bits
        return one(DD) / sqrt(one(DD)/a)
    end

    # initial approximation to 1/sqrt(a)
    r = DD(one(Float64)/sqrt(a.hi), zero(Float64))

    r = r + divby2( r * (one(DD) - (a*(r*r))) )
    r = r + divby2( r * (one(DD) - (a*(r*r))) )
    r = r + divby2( r * (one(DD) - (a*(r*r))) )

    r = a*r
    divby2(r + a/r)
end


function hypot(a::DD, b::DD)
    a = abs(a)
    b = abs(b)
    t, x = min(a,b), max(a,b)
    t = t/a
    x * sqrt(1.0 + t*t)
end

