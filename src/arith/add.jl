# addition

function (+){T<:DD}(a::T,b::T)
    s1, s2 = eftSum2(a.hi,b.hi)
    t1, t2 = eftSum2(a.lo,b.lo)
    s2 += t1
    s1, s2 = eftSum2inOrder(s1,s2)
    s2 += t2
    s1, s2 = eftSum2inOrder(s1,s2)
    DD(s1,s2)
end

function (+)(a::DD,b::Float64)
    s1, s2 = eftSum2(a.hi,b)
    s2 += a.lo
    s1, s2 = eftSum2inOrder(s1,s2)
    DD(s1,s2)
end

(+)(a::Float64,b::DD) = (+)(b,a)
(+)(a::DD,b::Signed) = (+)(a,convert(Float64,b))
(+)(a::Signed,b::DD) = (+)(b,a)

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

# multiplication


function (sqr)(a::DD)
  t1,t2 = eftProd2(a.hi,a.hi)
  t3 = a.hi * a.lo
  t5 = t3 + t3
  t6 = t2 + t5
  t1,t6 = eftSum2inOrder(t1,t6)
  DD(t1,t6)
end

function (*){T<:DD}(a::T,b::T)
  t1,t2 = eftProd2(a.hi,b.hi)
  t3 = a.hi * b.lo
  t4 = a.lo * b.hi
  t5 = t3 + t4
  t6 = t2 + t5
  t1,t6 = eftSum2inOrder(t1,t6)
  DD(t1,t6)
end

function (*)(a::DD,b::Float64)
  t1,t2 = eftProd2(a.hi,b)
  t4 = a.lo * b
  t6 = t2 + t4
  t1,t6 = eftSum2inOrder(t1,t6)
  DD(t1,t6)
end

(*)(a::Float64,b::DD) = (*)(b,a)
(*)(a::DD,b::Signed) = (*)(a,convert(Float64,b))
(*)(a::Signed,b::DD) = (*)(convert(Float64,a),b)



