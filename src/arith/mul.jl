# multiplication


function (sqr)(a::FF)
  t1,t2 = eftProd2(a.hi,a.hi)
  t3 = a.hi * a.lo
  t5 = t3 + t3
  t6 = t2 + t5
  t1,t6 = eftSum2inOrder(t1,t6)
  FF(t1,t6)
end

function (*){T<:FF}(a::T,b::T)
  t1,t2 = eftProd2(a.hi,b.hi)
  t3 = a.hi * b.lo
  t4 = a.lo * b.hi
  t5 = t3 + t4
  t6 = t2 + t5
  t1,t6 = eftSum2inOrder(t1,t6)
  FF(t1,t6)
end

function (*)(a::FF,b::Float64)
  t1,t2 = eftProd2(a.hi,b)
  t4 = a.lo * b
  t6 = t2 + t4
  t1,t6 = eftSum2inOrder(t1,t6)
  FF(t1,t6)
end

(*)(a::Float64,b::FF) = (*)(b,a)
(*)(a::FF,b::Signed) = (*)(a,convert(Float64,b))
(*)(a::Signed,b::FF) = (*)(convert(Float64,a),b)

