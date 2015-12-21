
const TieConcat = "⁀"

function show(io::IO, x::FF)
   # bfprec = get_bigfloat_precision()
   # set_bigfloat_precision(400)
   bf = convert(BigFloat, x)
   s  = @sprintf("%0.31g",bf)
   # set_bigfloat_precision(bfprec)
   print(io,s)
end

@inline function compactHi(x::FF)
     @sprintf("%0.7g", x.hi)
end
@inline function compactLo(x::FF)
     @sprintf("%0.5g", x.lo)
end

function halfcompact(x::FF)
    shi = compactHi(x)
    slo = compactLo(x)
    string(shi, TieConcat, slo)
end

function showcompact(io::IO, x::FF)
    s = string(compactHi(x), TieConcat, compactLo(x))
    print(io,s)
end

# read(IO, x), write(IO, x)

function read(io::IO, ::Type{FF})
    hi = read(io, Float64)
    lo = read(io, Float64)
    FF(hi,lo)
end
function write(io::IO, x::FF)
    write(io, x.hi)
    write(io, x.lo)
end


function parse(::Type{FF}, str::AbstractString)
    if !(startswith(str,FF_typename))
        convert(FF, parse(BigFloat,str))
    else
        s = str[10:(end-1)]
        hilo = split(s,',')
        if length(hilo)==1
            hilo = [hilo[1],"0.0"]
        end
        shi,slo = hilo[1],hilo[2]
        hi = parse(Float64,shi)
        lo = parse(Float64,slo)
        hi,lo = eftSum2(hi,lo)
        FF(hi,lo)
    end
end

function hex(x::FF)
    hi,lo = x.hi, x.lo
    shi = @sprintf("%a",hi)
    slo = @sprintf("%a",lo)
    s = string(FF_typename,"(",shi,", ",slo,")")
    s
end

