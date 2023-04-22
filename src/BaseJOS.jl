export BaseStructure, SlotDefinition

mutable struct BaseStructure
    class_of_reference::Any #= Supposed to be another BaseStructure =#
    slots::Dict{Symbol, Any}
end

mutable struct SlotDefinition
    name::Symbol
    initform::Any
end

function Base.hash(one::Slot)
    return hash(one.name) + hash(one.initform)
end

function Base.:(==)(one::Slot, another::Slot)
    return one.name == another.name
end

function Base.:(==)(one::Symbol, another::Slot)
    return one == another.name
end

function Base.:(==)(one::Slot, another::Symbol)
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
            Slot(:name, missing), 
            Slot(:direct_superclasses, []), 
            Slot(:class_precedence_list, []), 
            Slot(:slots, []), 
            Slot(:direct_subclasses, [])
        ],
        :class_precedence_list=>[Object, Top],
        :slots=>[
            Slot(:name, missing), 
            Slot(:direct_superclasses, []), 
            Slot(:class_precedence_list, []), 
            Slot(:slots, []), 
            Slot(:direct_subclasses, [])
        ]
    )
)

pushfirst!(getfield(Class, :slots)[:class_precedence_list], Class)

setfield!(Class, :class_of_reference, Class)
setfield!(Object, :class_of_reference, Class)
setfield!(Top, :class_of_reference, Class)
