typealias SignedInt Union{Int64,Int32}

FF(a::Float64) = FF(a,zero(Float64))
FF{T<:Float64}(a::Tuple{T}) = FF(a[1])
FF{T<:Float64}(a::Tuple{T,T}) = FF(a[1],a[2])

# idempotency
convert(::Type{FF}, x::FF) = x

# ambiguity reduction: first specify interconversion with Bool
convert(::Type{FF}, x::Bool) = convert(FF, convert(Float64,x))
convert(::Type{Bool}, x::FF) = ((x.hi != 0.0) | (x.lo != 0.0))
promote_rule(::Type{FF}, ::Type{Bool}) = FF

# ambiguity resolution: specify interconversion with Float64
convert(::Type{FF}, x::Float64) = FF(x,0.0)
convert(::Type{Float64}, x::FF) = x.hi
function convert(::Type{FF}, x::Float64, y::Float64)
    hi,lo = eftSum2(x,y)
    FF(hi,lo)
end
promote_rule(::Type{FF}, ::Type{Float64}) = FF

# autoprocessable types
for T in (:Int16, :Int32, :Int64, :Float16, :Float32,
          :(Rational{Int32}), :(Rational{Int64}))
    @eval begin
        convert(::Type{FF}, x::($T)) = convert(FF, convert(Float64,x))
        convert(::Type{$T}, x::FF) = convert(($T), FF.hi)
        promote_rule(::Type{FF}, ::Type{$T}) = FF
    end
end


# special numerical types
convert(::Type{BigFloat}, a::AbstractString) = parse(BigFloat, a)
convert{I<:Integer}(::Type{BigFloat}, a::I) = convert(BigFloat, string(a))
convert{I<:Integer}(::Type{BigFloat}, a::Rational{I}) =
    convert(BigFloat,convert(BigInt,num(a))) / convert(BigFloat,convert(BigInt, den(a)))

convert{S<:Symbol}(::Type{FF}, x::Irrational{S}) = convert(FF, convert(BigFloat,x))
FF{I<:Irrational}(x::I) = convert(FF, convert(BigFloat,x))
promote_rule{S<:Symbol}(::Type{FF}, ::Type{Irrational{S}}) = FF

# delegation with non-leaf types
convert(::Type{FF}, x::Integer) = convert(FF, convert(Float64, convert(Int64,x)))
convert(::Type{FF}, x::AbstractFloat) = convert(FF, convert(Float64,x))
convert(::Type{Integer}, x::FF) = convert(Int64, x.hi) + trunc(Int64, trunc(x.lo))
convert(::Type{AbstractFloat}, x::FF) = x.hi


convert(::Type{FF}, a::Tuple{Float64}) = FF(a[1])
convert(::Type{FF}, a::Tuple{Float64,Float64}) = FF(a[1],a[2])
convert(::Type{Tuple}, a::FF) = (a.hi,a.lo)
convert(::Type{Tuple{Float64,Float64}}, a::FF) = (a.hi,a.lo)

convert{T<:Signed}(::Type{FF}, a::Rational{T}) = convert(BigFloat, a)


function convert(::Type{FF}, a::BigFloat)
   hi,lo = nearest2(a)
   FF(hi,lo)
end
convert(::Type{BigFloat}, a::FF) = parse(BigFloat,string(a.hi)) + parse(BigFloat,string(a.lo))
convert(::Type{FF}, a::AbstractString) = convert(FF, convert(BigFloat,a))
convert{I<:Integer}(::Type{FF}, a::Rational{I}) =
    convert(FF, convert(BigFloat,a))

convert{I<:BigInt}(::Type{Rational{I}}, a::FF)    =
    convert(Rational{I},convert(BigFloat,a))
convert{I<:SignedInt}(::Type{Rational{I}}, a::FF) =
    trunc(T, convert(BigFloat, convert(Rational{BigInt}, a)))

convert{I<:Irrational}(::Type{FF}, x::I) = convert(FF, convert(BigFloat,x))

convert{T<:FF}(::Type{AbstractFloat}, a::T) = a.hi
convert{T<:FF}(::Type{Integer}, a::T) = convert(Int64, a.hi) + trunc(Int64, a.hi)

for T in (:Float64, :Float32, :Float16, :AbstractFloat,
          :Int64,   :Int32,   :Int16,   :Integer)
   @eval promote_rule(::Type{FF}, ::Type{($T)}) = FF
end
promote_rule{I<:Irrational}(::Type{FF}, ::Type{I}) = FF
