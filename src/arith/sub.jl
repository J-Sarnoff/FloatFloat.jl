# subtraction

function (-){T<:DD}(a::T,b::T)
    s1, s2 = eftDiff2(a.hi,b.hi)
    t1, t2 = eftDiff2(a.lo,b.lo)
    s2 += t1
    s1, s2 = eftSum2inOrder(s1,s2)
    s2 += t2
    s1, s2 = eftSum2inOrder(s1,s2)
    DD(s1,s2)
end

function (-)(a::DD,b::Float64)
    s1, s2 = eftDiff2(a.hi,b)
    s2 += a.lo
    s1, s2 = eftSum2inOrder(s1,s2)
    DD(s1,s2)
end

function (-)(a::Float64,b::DD)
    s1, s2 = eftDiff2(a,b.hi)
    s2 -= b.lo
    s1, s2 = eftSum2inOrder(s1,s2)
    DD(s1,s2)
end

(-)(a::DD,b::Signed) = (-)(a,convert(Float64,b))
(-)(a::Signed,b::DD) = (-)(convert(Float64,a),b)


