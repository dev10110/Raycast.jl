using Raycast
using Test

@testset "Raycast.jl: Simple" begin

    p0 = (0, 0, 0)
    p1 = (0, 5, 0)

    ray1 = bresenham(p0, p1)
    ray2 = collect(BresenhamProblem(p0, p1))

    expected_ray = [(0, 0, 0), (0, 1, 0), (0, 2, 0), (0, 3, 0), (0, 4, 0), (0, 5, 0)]

    @test all(ray1 .== expected_ray)
    @test all(ray2 .== expected_ray)

end


@testset "Raycast.jl: Complex" begin

    for i = 1:10
        p0 = Int64.((rand(Int8), rand(Int8), rand(Int8)))
        p1 = Int64.((rand(Int8), rand(Int8), rand(Int8)))

        ray1 = bresenham(p0, p1)
        prob = BresenhamProblem(p0, p1)

        @test length(ray1) == length(prob)

        ray2 = collect(BresenhamProblem(p0, p1))

        @test all(ray1 .== ray2)
    end
end


@testset "Raycast.jl: Throws" begin

    p0 = Int8.((0, 0, 0))
    p1 = Int8.((100, -57, 9))

    prob = BresenhamProblem(p0, p1)

    @test_throws DomainError collect(BresenhamProblem(p0, p1))

end
