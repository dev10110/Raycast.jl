module Raycast


export bresenham
export BresenhamProblem


# define basic types
"`Point2{T}` is an alias for `Tuple{T,T}`"
Point2{T} = Tuple{T, T}
"`Point3{T}` is an alias for `Tuple{T,T,T}`"
Point3{T} = Tuple{T, T, T}

# include the files
include("bresenham.jl")
include("bresenham_iterator.jl")


end
