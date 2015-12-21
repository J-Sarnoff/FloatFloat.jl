## FloatFloat.jl
#### floating point arithmetic with extended precision significands and faithful rounding
```ruby
                      Jeffrey A. Sarnoff                     2015-Dec-20
```                    


#### user manual

Pkg.clone("https://github.com/J-Sarnoff/FloatFloat.jl")        

    
```julia
using FloatFloat

ff10 = FF( 10 )
ffpi = FF( big(pi) )
ffsqrt2 = sqrt( FF( 2 ) )

ffrecip = 1/ffsqrt2
showcompact(ffsqrt2*ffrecip)

tst = [(ffsqrt2*ffpi*ffrecip - ffpi), (ffpi - ffsqrt2*ffpi*ffrecip)]
tidy(tst)


using Polynomials
p = Poly([4,-2,-1,5,1,-1]);
polyval(p, ffsqrt2)

```
