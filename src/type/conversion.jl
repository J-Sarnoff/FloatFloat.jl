typealias SignedInt Union{Int64,Int32}

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

# accuracy protection: specify interconversion with Big types
function convert(::Type{FF}, x::BigFloat)
   hi,lo = nearest2(x)
   FF(hi,lo)
end
function convert(::Type{BigFloat}, x::FF)
    #hi = parse(BigFloat, string(x.hi))
    #lo = parse(BigFloat, string(x.lo))
    #hi+lo
    big(x.hi)+big(x.lo)
end
promote_rule(::Type{FF}, ::Type{BigFloat}) = FF

function convert(::Type{FF}, x::Rational{BigInt})
   bf = convert(BigFloat,x.num) / convert(BigFloat,x.den)
   hi,lo = nearest2(bf)
   FF(hi,lo)
end
function convert(::Type{Rational{BigInt}}, x::FF)
    hi = convert(Rational{BigInt}, x.hi)
    lo = convert(Rational{BigInt}, x.lo)
    hi+lo
end
promote_rule(::Type{FF}, ::Type{Rational{BigInt}}) = FF

# rational types
convert{I<:Signed}(::Type{FF}, x::Rational{I}) = convert(FF, convert(Rational{BigInt},x))
convert{I<:Signed}(::Type{Rational{I}}, x::FF) = convert(Rational{I}, convert(Rational{BigInt},x))
promote_rule{I<:Signed}(::Type{Rational{I}}, ::Type{FF}) = FF

# autoprocessable types
for T in (:Int16, :Int32, :Int64, :Float16, :Float32)
    @eval begin
        convert(::Type{FF}, x::($T)) = convert(FF, convert(Float64,x))
        convert(::Type{$T}, x::FF) = convert(($T), FF.hi)
        promote_rule(::Type{FF}, ::Type{$T}) = FF
    end
end

# special numerical types

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

convert(::Type{FF}, a::AbstractString) = convert(FF, convert(BigFloat,a))
#convert{I<:Integer}(::Type{FF}, a::Rational{I}) = convert(FF, convert(Rational{BigInt},a))

convert{I<:Irrational}(::Type{FF}, x::I) = convert(FF, convert(BigFloat,x))

convert{T<:FF}(::Type{AbstractFloat}, a::T) = a.hi
convert{T<:FF}(::Type{Integer}, a::T) = convert(Int64, a.hi) + trunc(Int64, a.hi)

for T in (:Float64, :Float32, :Float16, :AbstractFloat,
          :Int64,   :Int32,   :Int16,   :Integer)
   @eval promote_rule(::Type{FF}, ::Type{($T)}) = FF
end
promote_rule{I<:Irrational}(::Type{FF}, ::Type{I}) = FF



FF(a::Float64) = FF(a,zero(Float64))
FF{T<:Float64}(a::Tuple{T}) = FF(a[1])
FF{T<:Float64}(a::Tuple{T,T}) = FF(a[1],a[2])

