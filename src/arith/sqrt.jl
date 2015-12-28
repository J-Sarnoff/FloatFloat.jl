
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
    end

    # initial approximation to 1/sqrt(a)
    r = FF(eftSqrt(1.0/a.hi)...)

    h = one(FF) - a*(r*r)
    r = r + divby2(r)*h

    h = one(FF) - a*(r*r)
    r = r + divby2(r)*h

    h = one(FF) - a*(r*r)
    r = r + divby2(r)*h

    a*r
end
