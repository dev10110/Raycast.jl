
"""
    BresenhamProblem(start_point::Point3, end_point::Point3)

returns an iterator that will cast a ray from start_point to end_point.


# Examples
```julia-repl
julia> p0 = (0,0,0)
julia> p1 = (10,0,0)

julia> for p in BresenhamProblem(p0, p1)
         @show p
       end
```

"""
struct BresenhamProblem{T}
    start_point::Point3{T}
    end_point::Point3{T}
end

struct BresenhamState{T<:Integer}
    point::Point3{T}
    dir::T # x=1, y=2, z=3
    d::Point3{T} # dx, dy, dz
    s::Point3{T} # xs, ys, zs
    p1::T
    p2::T
end


function Base.length(prob::BresenhamProblem{T}) where {T}
    x1, y1, z1 = prob.start_point
    x2, y2, z2 = prob.end_point

    dx = abs(x2 - x1)
    dy = abs(y2 - y1)
    dz = abs(z2 - z1)

    return Int(maximum((dx, dy, dz))) + 1
end


function Base.eltype(prob::BresenhamProblem{T}) where {T}
    return Point3{T}
end


function Base.isdone(prob::BresenhamProblem{T}) where {T}
    return (prob.start_point == prob.end_point)
end

function Base.isdone(prob::BresenhamProblem{T}, state::BresenhamState{T}) where {T}
    return (state.point == prob.end_point)
end


function Base.iterate(prob::BresenhamProblem{T}) where {T}
    # needs to return first result, and the state
    x1 = prob.start_point[1]
    y1 = prob.start_point[2]
    z1 = prob.start_point[3]
    x2 = prob.end_point[1]
    y2 = prob.end_point[2]
    z2 = prob.end_point[3]

    if (maximum(abs.((x1, y1, z1, x2, y2, z2))) > typemax(T) / 2)
        throw(
            DomainError(
                "type $(T) is likely too small for this problem. Consider casting your input to Int64",
            ),
        )
    end

    dx = abs(x2 - x1)
    dy = abs(y2 - y1)
    dz = abs(z2 - z1)

    xs = (x2 > x1) ? T(1) : T(-1)
    ys = (y2 > y1) ? T(1) : T(-1)
    zs = (z2 > z1) ? T(1) : T(-1)

    # Driving axis is X-axis
    if (dx >= dy && dx >= dz)
        dir = T(1)
        p1 = T(2) * dy - dx
        p2 = T(2) * dz - dx
        # Driving axis is Y-axis
    elseif (dy >= dx && dy >= dz)
        dir = T(2)
        p1 = T(2) * dx - dy
        p2 = T(2) * dz - dy
        # Driving axis is Z-axis
    else
        dir = T(3)
        p1 = T(2) * dy - dz
        p2 = T(2) * dx - dz
    end

    state = BresenhamState(prob.start_point, dir, (dx, dy, dz), (xs, ys, zs), p1, p2)

    return prob.start_point, state
end


function Base.iterate(prob::BresenhamProblem{T}, state::BresenhamState{T}) where {T}
    # if done, return nothing
    if (state.point == prob.end_point)
        return nothing
    end

    # extract fields
    x1 = state.point[1]
    y1 = state.point[2]
    z1 = state.point[3]
    dx = state.d[1]
    dy = state.d[2]
    dz = state.d[3]
    xs = state.s[1]
    ys = state.s[2]
    zs = state.s[3]
    p1 = state.p1
    p2 = state.p2

    # Driving axis is X-axis
    if (state.dir == T(1))
        if (p1 >= T(0))
            y1 += ys
            p1 -= T(2) * dx
        end
        if (p2 >= T(0))
            z1 += zs
            p2 -= T(2) * dx
        end
        x1 += xs
        p1 += T(2) * dy
        p2 += T(2) * dz
        # Driving axis is Y-axis
    elseif (state.dir == T(2))
        if (p1 >= T(0))
            x1 += xs
            p1 -= T(2) * dy
        end
        if (p2 >= T(0))
            z1 += zs
            p2 -= T(2) * dy
        end
        y1 += ys
        p1 += T(2) * dx
        p2 += T(2) * dz
        # Driving axis is Z-axis
    else
        if (p1 >= T(0))
            y1 += ys
            p1 -= T(2) * dz
        end
        if (p2 >= T(0))
            x1 += xs
            p2 -= T(2) * dz
        end
        z1 += zs
        p1 += T(2) * dy
        p2 += T(2) * dx
    end

    next_state = BresenhamState((x1, y1, z1), state.dir, state.d, state.s, p1, p2)
    return (x1, y1, z1), next_state
end
