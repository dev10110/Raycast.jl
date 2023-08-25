var documenterSearchIndex = {"docs":
[{"location":"","page":"Home","title":"Home","text":"CurrentModule = Raycast","category":"page"},{"location":"#Raycast","page":"Home","title":"Raycast","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Documentation for Raycast.","category":"page"},{"location":"","page":"Home","title":"Home","text":"Provides a simple and fast method to run the Bresenham algorithm for raycasting in 3D. ","category":"page"},{"location":"#Usage","page":"Home","title":"Usage","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"using Raycast\n\np0 = (0,0,0)      # any tuple of integers will work\np1 = (10, 5, -3)  # any tuple of integers will work\n\nprob = BresenhamProblem(p0, p1)\nfor p in prob\n  @show p\nend","category":"page"},{"location":"","page":"Home","title":"Home","text":"When you construct BresenhamProblem it returns an iterator, so you can do things like","category":"page"},{"location":"","page":"Home","title":"Home","text":"collect(prob)","category":"page"},{"location":"","page":"Home","title":"Home","text":"or ","category":"page"},{"location":"","page":"Home","title":"Home","text":"length(prob)","category":"page"},{"location":"","page":"Home","title":"Home","text":"The benefit of using the iterator interface is that it is non-allocating, and can support early termination. For instance, ","category":"page"},{"location":"","page":"Home","title":"Home","text":"using Raycast # hide\nusing LinearAlgebra\np0 = (0,0,0) \np1 = (100000000, 5, -3)\n\nprob = BresenhamProblem(p0, p1)\nbegin\n  for p in prob\n     @show p\n     if (norm(p) > 10) \n       println(\"far!\")\n       break\n     end\n  end\nend","category":"page"},{"location":"","page":"Home","title":"Home","text":"Alternatively, if you don't like the iterator interface, you can directly call","category":"page"},{"location":"","page":"Home","title":"Home","text":"p1 = (10, 5, -3)  # any tuple of integers will work\nbresenham(p0, p1)","category":"page"},{"location":"","page":"Home","title":"Home","text":"to get the entire vector. Note, this is slower than collect(prob) (and gives the same result) so there is really no reason to use this. ","category":"page"},{"location":"#WARNING","page":"Home","title":"WARNING","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"The code is type-stable. Since sometimes we double some quantities, this can cause a integer overflow. ","category":"page"},{"location":"","page":"Home","title":"Home","text":"Therefore, it is safest to ensure your input is of type Int64. There is no meaningful loss of speed if you do this.  An error will be thrown if it is likely for your types to overflow","category":"page"},{"location":"#Credits","page":"Home","title":"Credits","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"The code (and logic) is taken from https://www.geeksforgeeks.org/bresenhams-algorithm-for-3-d-line-drawing/","category":"page"},{"location":"#Index","page":"Home","title":"Index","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"","category":"page"},{"location":"#API","page":"Home","title":"API","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Modules = [Raycast]","category":"page"},{"location":"#Raycast.BresenhamProblem","page":"Home","title":"Raycast.BresenhamProblem","text":"BresenhamProblem(start_point::Point3, end_point::Point3)\n\nreturns an iterator that will cast a ray from startpoint to endpoint.\n\nExamples\n\njulia> p0 = (0,0,0)\njulia> p1 = (10,0,0)\n\njulia> for p in BresenhamProblem(p0, p1)\n         @show p\n       end\n\n\n\n\n\n","category":"type"},{"location":"#Raycast.Point2","page":"Home","title":"Raycast.Point2","text":"Point2{T} is an alias for Tuple{T,T}\n\n\n\n\n\n","category":"type"},{"location":"#Raycast.Point3","page":"Home","title":"Raycast.Point3","text":"Point3{T} is an alias for Tuple{T,T,T}\n\n\n\n\n\n","category":"type"},{"location":"#Raycast.bresenham-Union{Tuple{T}, Tuple{Tuple{T, T, T}, Tuple{T, T, T}}} where T<:Integer","page":"Home","title":"Raycast.bresenham","text":"bresenham(start_point::Point3, end_point::Point3)\n\nreturns a Vector{Point3} of the pixels touched by the ray connecting start point to end point\n\n\n\n\n\n","category":"method"},{"location":"#Raycast.bresenham-Union{Tuple{T}, Tuple{Tuple{T, T}, Tuple{T, T}}} where T<:Integer","page":"Home","title":"Raycast.bresenham","text":"bresenham(start_point::Point2, end_point::Point2)\n\nreturns a Vector{Point2} of the pixels touched by the ray connecting start point to end point\n\n\n\n\n\n","category":"method"}]
}