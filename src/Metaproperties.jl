export class_of, assert_subclass_of,
    class_name, class_direct_slots, class_slots, class_direct_superclasses, class_cpl

class_of(instance::BaseStructure) = begin
    getfield(instance, :class_of_reference)
end

assert_subclass_of(instance, targetClass, exception) = begin
    if !(targetClass in getfield(class_of(instance), :slots)[:class_precedence_list])
        throw(exception("Given " * String(getfield(targetClass, :slots)[:name]) * " is not a " * String(getfield(targetClass, :slots)[:name])))
    end
end

class_name(class::BaseStructure) = begin
    assert_subclass_of(class, Class, ArgumentError)
    return getfield(class, :slots)[:name]
end

class_direct_slots(class::BaseStructure) = begin
    assert_subclass_of(class, Class, ArgumentError)
    return getfield(class, :slots)[:direct_slots]
end

class_slots(class::BaseStructure) = begin
    assert_subclass_of(class, Class, ArgumentError)
    return getfield(class, :slots)[:slots]
end

class_direct_superclasses(class::BaseStructure) = begin
    assert_subclass_of(class, Class, ArgumentError)
    return getfield(class, :slots)[:direct_superclasses]
end

class_cpl(class::BaseStructure) = begin
    assert_subclass_of(class, Class, ArgumentError)
    return getfield(class, :slots)[:class_precedence_list]
end