## FloatFloat.jl
#### floating point arithmetic with extended precision significands and faithful rounding
```ruby
                      Jeffrey A. Sarnoff                     2015-Dec-20
```                    


##### the user manual

Pkg.clone("https://github.com/J-Sarnoff/FloatFloat.jl")        

    
```julia
using FloatFloat

dd10 = DD( 10 )
ddpi = DD( big(pi) )
ddsqrt2 = sqrt( DD( 2 ) )

ddrecip = 1/ddsqrt2
showcompact(ddsqrt2*ddrecip)

tst = [(ddsqrt2*ddpi*ddrecip - ddpi), (ddpi - ddsqrt2*ddpi*ddrecip)]
tidy(tst)

```
