using Main.JuliaObjectSystem
using Test

@testset "Test Top, Object and Class" begin
    @test getfield(Top, :slots)[:name] == :Top
    @test getfield(Top, :slots)[:class_precedence_list] == [Top]
    @test getfield(Top, :slots)[:direct_superclasses] == []
    @test getfield(Top, :slots)[:direct_slots] == []
    @test getfield(Top, :slots)[:slots] == []

    @test getfield(Object, :slots)[:name] == :Object
    @test getfield(Object, :slots)[:class_precedence_list] == [Object, Top]
    @test getfield(Object, :slots)[:direct_superclasses] == [Top]
    @test getfield(Object, :slots)[:direct_slots] == []
    @test getfield(Object, :slots)[:slots] == []

    @test getfield(Class, :slots)[:name] == :Class
    @test getfield(Class, :slots)[:class_precedence_list] == [Class, Object, Top]
    @test getfield(Class, :slots)[:direct_superclasses] == [Object]
    @test length(getfield(Class, :slots)[:direct_slots]) == 5
    @test length(getfield(Class, :slots)[:slots]) == 5
end