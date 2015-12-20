
#=
The internal structure is 128 bits given as a magnitude-ordered pair of Float64 values.
The pair are *presumed* to be in cannonical form, where they do not overlap: hi⊕lo ≡ hi.
This representation is known as "double-double" (see refs.md)
=#

#    type FF (FloatFloat)

immutable DD <: Real
    hi::Float64
    lo::Float64
end

