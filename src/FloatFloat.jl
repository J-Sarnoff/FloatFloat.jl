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


include("module/ErrorFree/ErrorFree.jl")
using .ErrorFree
include("module/Adjacent/Adjacent.jl")
using .Adjacent
include("module/RoundFast/RoundFast.jl")
using .RoundFast


include("type/FF.jl")
include("type/conversion.jl")
include("type/io.jl")

include("number/compare.jl")
include("number/inquire.jl")
include("number/portion.jl")

include("arith/add.jl")
include("arith/sub.jl")
include("arith/mul.jl")
include("arith/div.jl")
include("arith/sqrt.jl")







end # module FloatFloat
