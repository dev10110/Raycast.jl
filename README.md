# Raycast

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://dev10110.github.io/Raycast.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://dev10110.github.io/Raycast.jl/dev/)
[![Build Status](https://github.com/dev10110/Raycast.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/dev10110/Raycast.jl/actions/workflows/CI.yml?query=branch%3Amain)

`Raycast.jl` provides a simple but fast 3D raycasting function. It is non-allocating and only uses integer-arithmetic. 

```julia
using Raycast

p0 = (0,0,0)      # any tuple of integers will work
p1 = (10, 5, -3)  # any tuple of integers will work

prob = BresenhamProblem(p0, p1)
for p in prob
   @show p
end
```

## Installation
```
] add https://github.com/dev10110/Raycast.jl
```

## Documentation
See [the docs](https://dev10110.github.io/Raycast.jl/dev/) for details.
