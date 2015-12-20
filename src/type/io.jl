
const TieConcat = "⁀"

function show(io::IO, x::DD)
   # bfprec = get_bigfloat_precision()
   # set_bigfloat_precision(400)
   bf = convert(BigFloat, x)
   s  = @sprintf("%0.31g",bf)
   # set_bigfloat_precision(bfprec)
   print(io,s)
end

@inline function compactHi(x::DD)
     @sprintf("%0.7g", x.hi)
end
@inline function compactLo(x::DD)
     @sprintf("%0.5g", x.lo)
end

function halfcompact(x::DD)
    shi = compactHi(x)
    slo = compactLo(x)
    string(shi, TieConcat, slo)
end

function showcompact(io::IO, x::DD)
    s = string(compactHi(x), TieConcat, compactLo(x))
    print(io,s)
end

# read(IO, x), write(IO, x)

function read(io::IO, ::Type{DD})
    hi = read(io, Float64)
    lo = read(io, Float64)
    DD(hi,lo)
end
function write(io::IO, x::DD)
    write(io, x.hi)
    write(io, x.lo)
end


function parse(::Type{DD}, str::AbstractString)
    if !(startswith(str,DD_typename))
        convert(DD, parse(BigFloat,str))
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
        DD(hi,lo)
    end    
end

function hex(x::DD)
    hi,lo = x.hi, x.lo
    shi = @sprintf("%a",hi)
    slo = @sprintf("%a",lo)
    s = string(DD_typename,"(",shi,", ",slo,")")
    s
end

