(VERSION >= v"0.4.0") && __precompile__()

module FloatFloat

                                                #   FloatFloat
import Base: convert, promote_rule,             # <--------------
    read, write, show, showcompact,             #  dispatching  |
    string, parse, hex,                         #               |
    zero, one, isinf, isnan, isfinite,          #               |
    abs, sign, signbit, copysign, flipsign,     #               |    
    isequal, isless, (<),(<=),(==),(>=),(>),    #               |
    ldexp, frexp, modf,                         #               |
    (+),(-),(*),(/),(\),                        #               |
    sqrt, hypot,                                #               |
    round, floor, ceil, trunc, fld, cld,        #               |    
    div, rem, divrem, mod, fldmod, (%),         # <--------------
    (^), fma
#=
    exp, log, log2, log10, expm1, log1p,
    sin, cos, tan, csc, sec, cot,
    sinh, cosh, tanh, csch, sech, coth,
    asin, acos, atan, acsc, asec, acot, atan2,
    asinh, acosh, atanh, acsch, asech, acoth
 =#

export FF,    # constructor
       fluff  # softens (zeros low order part if eps(eps(high order part)) >= low order part)


include("type/FF.jl")
include("type/conversion.jl")
include("type/io.jl")

include("number/compare.jl")
include("number/inquire.jl")
include("number/portion.jl")






end # module FloatFloat
