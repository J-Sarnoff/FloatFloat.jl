## FloatFloat.jl
#### floating point arithmetic with extended precision significands and faithful rounding
```ruby
                      Jeffrey A. Sarnoff                     2015-Dec-20
```                    


#### user manual

Pkg.clone("https://github.com/J-Sarnoff/FloatFloat.jl")        

    
```julia
julia> using FloatFloat

julia> f10 = FF( 10 )
10

julia> fpi = FF( pi )
3.14159265358979323846264338328

julia> fsqrt10 = sqrt( f10 )
3.162277660168379331998893544433

julia> frecip = 1/fsqrt10
0.3162277660168379331998893544433

julia> showcompact(ffsqrt10*frecip)
ERROR: UndefVarError: ffsqrt10 not defined

julia> tst = [(fsqrt10*fpi*frecip - fpi),]
1-element Array{FloatFloat.FF,1}:
 2.46519e-32⁀0 

julia> tidy(tst)
1-element Array{FloatFloat.FF,1}:
 0 ⁀0 

julia> using Polynomials

julia> p = Poly([4,-2,-1,5,1,-1]);

julia> polyval(p, fsqrt10)
-70.4384383287557252639424643105

julia> polyval(p, fpi)
-65.73200005804886024467917978566

julia> polyval(p, frecip)
3.432496073314574720868167074791



```
