function hypot(a::FF, b::FF)
    a = abs(a)
    b = abs(b)
    t, x = minmax(a,b)
    t = t/a
    t *= t
    t += one(FF)
    x * sqrt(t)
end

