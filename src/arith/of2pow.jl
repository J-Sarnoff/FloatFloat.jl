
@inline function mulby2(a::FF)
    FF(a.hi*2.0, a.lo*2.0)
end

@inline function divby2(a::FF)
    FF(a.hi*0.5, a.lo*0.5)
end

@inline function mulbypow2(a::FF,p::Float64)
    FF(a.hi*p, a.lo*p)
end

@inline function divbypow2(a::FF,p::Float64)
    fr,xp = frexp(p)
    mulbypow2(a, ldexp(fr,-xp))
end

