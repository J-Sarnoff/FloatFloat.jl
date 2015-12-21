
# division

function (/){T<:FF}(a::T,b::T)
  q1 = a.hi / b.hi
  r  = a - (q1 * b)

  q2 = r.hi / b.hi
  r = r - (q2 * b)

  q3 = r.hi / b.hi

  q1,q2 = eftSum2inOrder(q1, q2)
  q1,q2 = eftSum3as2(q1,q2,q3)
  FF(q1,q2)
end

