# subtraction

function (-){T<:FF}(a::T,b::T)
    s1, s2 = eftDiff2(a.hi,b.hi)
    t1, t2 = eftDiff2(a.lo,b.lo)
    s2 += t1
    s1, s2 = eftSum2inOrder(s1,s2)
    s2 += t2
    s1, s2 = eftSum2inOrder(s1,s2)
    FF(s1,s2)
end

function (-)(a::FF,b::Float64)
    s1, s2 = eftDiff2(a.hi,b)
    s2 += a.lo
    s1, s2 = eftSum2inOrder(s1,s2)
    FF(s1,s2)
end

function (-)(a::Float64,b::FF)
    s1, s2 = eftDiff2(a,b.hi)
    s2 -= b.lo
    s1, s2 = eftSum2inOrder(s1,s2)
    FF(s1,s2)
end

(-)(a::FF,b::Signed) = (-)(a,convert(Float64,b))
(-)(a::Signed,b::FF) = (-)(convert(Float64,a),b)


