(VERSION >= v"0.4.0") && __precompile__()

module FloatFloat

#                                                   FloatFloat
import Base: convert, promote_rule,             # <--------------
    read, write, show, showcompact,             #  dispatching  |
    zero, one, isinf, isnan, isfinite,          #               |
    abs, sign, signbit, copysign, flipsign,     #               |
    isequal, isless, (<),(<=),(==),(>=),(>),    #               |
    ldexp, frexp, modf, eps, exponent,          #               |
    (+),(-),(*),(/),(\),                        #               |
    sqrt, hypot,                                #               |
    round, floor, ceil, trunc, fld, cld,        #               |
    div, rem, divrem, mod, fldmod, (%),         # <--------------
    (^), fma, Rational,  string, parse, hex


export FF,     # constructor
       tidy,   # cleans up numerical noise (!! look at the data before tidying up !!)
       ulp,    # unit last place
       stretch # opposite of trunc, extends away from zero to nearest integer

include("module/ErrorFree.jl/src/ErrorFree.jl")
using .ErrorFree
include("module/Adjacent.jl/src/Adjacent.jl")
using .Adjacent
include("module/RoundFast.jl/src/RoundFast.jl")
using .RoundFast


include("type/FF.jl")
include("type/conversion.jl")
include("type/nearest.jl")
include("type/io.jl")
include("type/tidyval.jl")

include("number/compare.jl")
include("number/inquire.jl")
include("number/portion.jl")

include("arith/of2pow.jl")
include("arith/add.jl")
include("arith/sub.jl")
include("arith/mul.jl")
include("arith/div.jl")
include("arith/sqrt.jl")
include("arith/hypot.jl")

end
