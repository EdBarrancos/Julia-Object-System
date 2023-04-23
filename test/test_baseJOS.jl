using Test

@testset "Test Top, Object and Class" begin
    @test class_name(Top) == :Top
    @test class_cpl(Top)  == [Top]
    @test class_direct_superclasses(Top) == []
    @test class_direct_slots(Top)  == []
    @test class_slots(Top)  == []
    @test class_of(Top) === Class


    @test class_name(Object) == :Object
    @test class_cpl(Object)  == [Object, Top]
    @test class_direct_superclasses(Object) == [Top]
    @test class_direct_slots(Object)  == []
    @test class_slots(Object)  == []
    @test class_of(Object) === Class

    @test class_name(Class) == :Class
    @test class_cpl(Class)  == [Class, Object, Top]
    @test class_direct_superclasses(Class) == [Object]
    @test length(class_direct_slots(Class))  == 5
    @test length(class_slots(Class))  == 5
    @test class_of(Class) === Class

    @test class_name(GenericFunction) == :GenericFunction
    @test class_cpl(GenericFunction)  == [GenericFunction, Object, Top]
    @test class_direct_superclasses(GenericFunction) == [Object]
    @test length(class_direct_slots(GenericFunction))  == 3
    @test length(class_slots(GenericFunction))  == 3
    @test class_of(GenericFunction) === Class

    @test class_name(MultiMethod) == :MultiMethod
    @test class_cpl(MultiMethod)  == [MultiMethod, Object, Top]
    @test class_direct_superclasses(MultiMethod) == [Object]
    @test length(class_direct_slots(MultiMethod))  == 3
    @test length(class_slots(MultiMethod))  == 3
    @test class_of(MultiMethod) === Class
end