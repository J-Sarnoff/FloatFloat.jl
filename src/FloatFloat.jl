(VERSION >= v"0.4.0") && __precompile__()

module FloatFloat


import Base: convert, promote_rule,
    read, write, show, showcompact, 
    string, parse, hex,
    zero, one, isinf, isnan, isfinite,
    abs, sign, signbit, copysign, flipsign,
    isequal, isless, (<),(<=),(==),(>=),(>),
    ldexp, frexp, modf,
    (+),(-),(*),(/),(\), 
    round, floor, ceil, trunc, fld, cld,
    div, rem, divrem, mod, fldmod, (%),
    sqrt, hypot, (^), fma,
    exp, log, log2, log10, expm1, log1p,
    sin, cos, tan, csc, sec, cot,
    sinh, cosh, tanh, csch, sech, coth,
    asin, acos, atan, acsc, asec, acot, atan2,
    asinh, acosh, atanh, acsch, asech, acoth


export FF,
       iszero, isnotzero
       




end # module FloatFloat
