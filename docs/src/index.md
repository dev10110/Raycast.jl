```@meta
CurrentModule = Raycast
```

# Raycast

Documentation for [Raycast](https://github.com/dev10110/Raycast.jl).

Provides a simple and fast method to run the Bresenham algorithm for raycasting in 3D. 

## Usage

```@example 1
using Raycast

p0 = (0,0,0)      # any tuple of integers will work
p1 = (10, 5, -3)  # any tuple of integers will work

prob = BresenhamProblem(p0, p1)
for p in prob
  @show p
end
```

When you construct `BresenhamProblem` it returns an iterator, so you can do things like
```@example 1
collect(prob)
```

or 
```@example 1
length(prob)
```

The benefit of using the iterator interface is that it is non-allocating, and can support early termination. For instance, 
```@example 2
using Raycast # hide
using LinearAlgebra
p0 = (0,0,0) 
p1 = (100000000, 5, -3)

prob = BresenhamProblem(p0, p1)
begin
  for p in prob
     @show p
     if (norm(p) > 10) 
       println("far!")
       break
     end
  end
end
```

Alternatively, if you don't like the iterator interface, you can directly call
```@example 1
p1 = (10, 5, -3)  # any tuple of integers will work
bresenham(p0, p1)
```
to get the entire vector. Note, this is slower than `collect(prob)` (and gives the same result) so there is really no reason to use this. 


## WARNING
The code is type-stable. Since sometimes we double some quantities, this can cause a integer overflow. 

Therefore, it is safest to ensure your input is of type `Int64`. There is no meaningful loss of speed if you do this. 
An error will be thrown if it is likely for your types to overflow


## Credits
The code (and logic) is taken from <https://www.geeksforgeeks.org/bresenhams-algorithm-for-3-d-line-drawing/>


## Index
```@index
```

## API
```@autodocs
Modules = [Raycast]
```
