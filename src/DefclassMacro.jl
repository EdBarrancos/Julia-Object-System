macro defclass(name, superclasses, slots, options...)
    target_name = QuoteNode(name)
    
    #= Calculate Slots =#
    direct_slots_definition = []
    for slot in slots.args
        # TODO -> Reader and writer method
        if typeof(slot) != Expr
            # Just name of the slot defined
            push!(direct_slots_definition, Slot(slot, missing))
        elseif slot.head == :vect
            new_slot = SlotDefinition(:missing, missing)

            for option in slot.args
                if typeof(option) != Expr
                    # name of the slot
                    setfield!(new_slot, :name, option)
                elseif option.head == :(=)
                    if option.args[begin] == :reader
                        # TODO
                    elseif option.args[begin] == :writer
                        # TODO
                    elseif option.args[begin] == :initform
                        setfield!(new_slot, :initform, option.args[end])
                    else
                        new_slot = Slot(option.args[begin], option.args[end])
                    end
                end
            end

            push!(direct_slots_definition, new_slot)
        elseif slot.head == :(=)
            push!(direct_slots_definition, Slot(slot.args[begin], slot.args[end]))
        end
    end

    metaclass = Class
    for option in options
        if typeof(option) == Expr && option.head == :(=)
            if option.args[begin] == :metaclass
                metaclass = option.args[end]
            else
                error("Unrecognized option")
            end
        else
            error("Invalid Option Syntax. Example: @defclass(SuperHuman, [], [], metaclass=SuperMetaClass)")
        end
    end
    
    
    return esc(
        quote 
            #$name = allocate_instance($metaclass)
            $name = BaseStructure(
                $metaclass,
                Dict(
                    :name = $target_name,
                    :direct_superclasses = length($superclasses) > 0 ? $superclasses : [Object],
                    :direct_slots = $direct_slots_definition,
                    :class_precedence_list = length($superclasses) > 0 ? $superclasses : [Object], # TODO: Compute class_precedence_list
                    :slots = $direct_slots_definition #TODO: Compute slots
                )
            )
            $name
        end
    )
end