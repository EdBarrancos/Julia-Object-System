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