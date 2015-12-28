
# roots


#=
     for a in [1e-15..1e18]
      relerr ~1.3e-32  (106 bits)
=#
function sqrt(a::FF)
    if a.hi <= zero(Float64)
       if a.hi == zero(Float64)
           return zero(FF)
       else
           throw(ArgumentError("sqrt expects a nonnegative base"))
       end
    elseif (a.hi < 1.0e-18) | (a.hi > 1.0e18)
        throw(ArgumentError("sqrt arg ($a) outside domain"))
    end

    if (a.hi < 1.0e-7)  # -log2(1.0e-7) < (1/2) Float64 significand bits
        return one(FF) / sqrt(one(FF)/a)
    end

    # initial approximation to 1/sqrt(a)
    r = FF(one(Float64)/sqrt(a.hi), zero(Float64))

    r = r + divby2( r * (one(FF) - (a*(r*r))) )
    r = r + divby2( r * (one(FF) - (a*(r*r))) )
    r = r + divby2( r * (one(FF) - (a*(r*r))) )

    r = a*r
    divby2(r + a/r)
end
