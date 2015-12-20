

# converted from crlibm

function ieeedouble(xx::BigFloat)
    x=logabs=powermin=0.0
    mantissa=exponent=expmin=expmax=expmiddle=powermax=powermiddle=infmantissa=0.0
    sgn=0
    set_bigfloat_precision(320) ; #Digits = 100;
    x = xx;#$evalf(xx);
    if (x==0)
        sgn, exponent, mantissa = 1, -1022, 0
    else
      if (x < 0)
         sgn = -1
      else
        sgn = 1
      end
      x = abs(x);
      if x >=  2.0^(1023)*(2-2.0^(-53))
        mantissa = Inf
        exponent = 1023
      elseif x <= 2.0^(-1075)
        mantissa = 0; exponent = -1022
      elseif x <= 2.0^(-1022)
       exponent = -1022
      else
    # x is between 2^(-1022) and 2^(1024)
         powermin = 2.0^(-1022); expmin = -1022;
         powermax = 2^1024; expmax = 1024;
         while (expmax-expmin > 1)
            expmiddle = round(Int,(expmax+expmin)/2);
            powermiddle = 2.0^expmiddle;
            if x >= powermiddle
                powermin = powermiddle;
                expmin = expmiddle
            else
                powermax = powermiddle;
                expmax = expmiddle
            end
          end
          # now, expmax - expmin = 1 and powermin <= x < powermax,
          # powermin = 2^expmin and powermax = 2^expmax, so expmin is the exponent of x
          exponent = expmin;
         #end;
         infmantissa = x*2.0^(52-exponent);
         if infmantissa-round(Int,infmantissa) != 0.5
            mantissa = round(Int,infmantissa)
            else
              mantissa = floor(Int,infmantissa);
               if reinterpret(UInt64,mantissa) & one(UInt64) == one(UInt64)
                  mantissa = mantissa+1
               end
            end
         mantissa = mantissa*2.0^(-52);
      #end;
      end;
    end;
    sgn,exponent,mantissa;
end

function nearest(x::BigFloat)
    sgn,exponent,mantissa = ieeedouble(x)
    mantissa = convert(Float64,mantissa)
    sgn>=0 ? ldexp(mantissa,exponent) : -ldexp(mantissa,exponent)
end


function nnear(n::Int,x::BigFloat)
    bfprec = get_bigfloat_precision()
    set_bigfloat_precision(1280)
    z = zeros(Float64,n)
    z[1] = nearest(x)
    rm = x-BigFloat(z[1])
    for i in 2:n
       z[i] = nearest(rm)
       rm = rm - BigFloat(z[i])
    end
    set_bigfloat_precision(bfprec)
    z
 end

nearest2(x::BigFloat) = nnear(2,x)

