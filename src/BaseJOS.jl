export BaseStructure, SlotDefinition, 
    Top, Object, Class

mutable struct BaseStructure
    class_of_reference::Any #= Supposed to be another BaseStructure =#
    slots::Dict{Symbol, Any}
end

mutable struct SlotDefinition
    name::Symbol
    initform::Any
end

function Base.hash(one::SlotDefinition)
    return hash(one.name) + hash(one.initform)
end

function Base.:(==)(one::SlotDefinition, another::SlotDefinition)
    return one.name == another.name
end

function Base.:(==)(one::Symbol, another::SlotDefinition)
    return one == another.name
end

function Base.:(==)(one::SlotDefinition, another::Symbol)
    return one.name == another
end

Top = BaseStructure(
    nothing,
    Dict(
        :name=>:Top,
        :direct_superclasses=>[], 
        :direct_slots=>[],
        :class_precedence_list=>[],
        :slots=>[],
    )
)

pushfirst!(getfield(Top, :slots)[:class_precedence_list], Top)

Object = BaseStructure(
    nothing,
    Dict(
        :name=>:Object,
        :direct_superclasses=>[Top], 
        :direct_slots=>[],
        :class_precedence_list=>[Top],
        :slots=>[]
    )
)

pushfirst!(getfield(Object, :slots)[:class_precedence_list], Object)

Class = BaseStructure(
    nothing,
    Dict(
        :name=>:Class,
        :direct_superclasses=>[Object], 
        :direct_slots=>[
            SlotDefinition(:name, missing), 
            SlotDefinition(:direct_superclasses, []), 
            SlotDefinition(:class_precedence_list, []), 
            SlotDefinition(:slots, []), 
            SlotDefinition(:direct_subclasses, [])
        ],
        :class_precedence_list=>[Object, Top],
        :slots=>[
            SlotDefinition(:name, missing), 
            SlotDefinition(:direct_superclasses, []), 
            SlotDefinition(:class_precedence_list, []), 
            SlotDefinition(:slots, []), 
            SlotDefinition(:direct_subclasses, [])
        ]
    )
)

pushfirst!(getfield(Class, :slots)[:class_precedence_list], Class)

setfield!(Class, :class_of_reference, Class)
setfield!(Object, :class_of_reference, Class)
setfield!(Top, :class_of_reference, Class)
