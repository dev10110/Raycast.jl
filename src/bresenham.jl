


"""
    bresenham(start_point::Point2, end_point::Point2)

returns a Vector{Point2} of the pixels touched by the ray connecting start point to end point
"""
function bresenham(start_point::Point2{T}, end_point::Point2{T}) where {T <: Integer}

    x0 = start_point[1]
    y0 = start_point[2]

    x1 = end_point[1]
    y1 = end_point[2]

    dx = abs(x1 - x0)
    dy = abs(y1 - y0)

    sx = x0 < x1 ? 1 : -1
    sy = y0 < y1 ? 1 : -1

    err = (dx > dy ? dx : -dy) / 2

    inds = Point2{T}[]

    while (x0 != x1 || y0 != y1)

        push!(inds, (x0, y0) )

        e2 = err
        if e2 > -dx
            err -= dy
            x0 += sx
        end
        if e2 < dy
            err += dx
            y0 += sy
        end
    end
    return inds
end




"""
    bresenham(start_point::Point3, end_point::Point3)

returns a Vector{Point3} of the pixels touched by the ray connecting start point to end point
"""
function bresenham(start_point::Point3{T}, end_point::Point3{T}) where {T<:Integer}

    # extract the points
    x1 = start_point[1]
    y1 = start_point[2]
    z1 = start_point[3]
    x2 = end_point[1]
    y2 = end_point[2]
    z2 = end_point[3]

    dx = abs(x2 - x1)
    dy = abs(y2 - y1)
    dz = abs(z2 - z1)

    
    xs = (x2 > x1) ? T(1) : T(-1)
    ys = (y2 > y1) ? T(1) : T(-1)
    zs = (z2 > z1) ? T(1) : T(-1)

    N = maximum((dx, dy, dz)) + T(1)
    
    if (maximum( abs.((x1, y1, z1, x2, y2, z2)) ) > typemax(T) / 2)
        throw(DomainError("type $(T) is likely too small for this problem. Consider casting your input to Int64"))
    end

    # allocate the output
    # ListOfPoints = Vector{Point3{T}}(undef, N)
    ListOfPoints = Point3{T}[]
    push!(ListOfPoints, (x1, y1, z1) )

    # Driving axis is X-axis
    if (dx >= dy && dx >= dz)
        p1 = T(2) * dy - dx
        p2 = T(2) * dz - dx
        while (x1 != x2)
            x1 += xs
            if (p1 >= 0)
                y1 += ys
                p1 -= T(2) * dx
            end
            if (p2 >= 0)
                z1 += zs
                p2 -= T(2) * dx
            end
            p1 += T(2) * dy
            p2 += T(2) * dz
            push!(ListOfPoints, (x1, y1, z1))
        end

    # Driving axis is Y-axis
    elseif (dy >= dx && dy >= dz)
        p1 = T(2) * dx - dy
        p2 = T(2) * dz - dy
        while (y1 != y2)
            y1 += ys
            if (p1 >= 0)
                x1 += xs
                p1 -= T(2) * dy
            end
            if (p2 >= 0)
                z1 += zs
                p2 -= T(2) * dy
            end
            p1 += T(2) * dx
            p2 += T(2) * dz
            push!(ListOfPoints, (x1, y1, z1))
        end


    # Driving axis is Z-axis
    else
        p1 = T(2) * dy - dz
        p2 = T(2) * dx - dz
        while (z1 != z2)
            z1 += zs
            if (p1 >= 0)
                y1 += ys
                p1 -= T(2) * dz
            end
            if (p2 >= 0)
                x1 += xs
                p2 -= T(2) * dz
            end
            p1 += T(2) * dy
            p2 += T(2) * dx
            push!(ListOfPoints, (x1, y1, z1))
        end
    end

    return ListOfPoints
end
