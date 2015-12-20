## FloatFloat.jl
#### floating point arithmetic with extended precision significands and faithful rounding
```ruby
                      Jeffrey A. Sarnoff                     2015-Dec-20
```                    

Julia is willing to install locally your own impression:  
>      Pkg.clone("https://github.com/J-Sarnoff/FloatFloat.jl")        

######*easy is it is easy*
    
    
```julia
using FloatFloat

ff10 = FF(10)
ffpi = FF( nearest2( big(pi) )... )
ffpi.hi, ffpi.lo

showcompact(fpi)
```
