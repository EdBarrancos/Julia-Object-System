export GenericFunction, MultiMethod

GenericFunction = BaseStructure(
    Class,
    Dict(
        :name=>:GenericFunction,
        :direct_superclasses=>[Object], 
        :direct_slots=>[
            Slot(:name, missing), 
            Slot(:lambda_list, missing), 
            Slot(:methods, missing)
        ],
        :class_precedence_list=>[Object, Top],
        :slots=>[
            Slot(:name, missing), 
            Slot(:lambda_list, missing), 
            Slot(:methods, missing)
        ]
    )
)

pushfirst!(getfield(GenericFunction, :slots)[:class_precedence_list], GenericFunction)

MultiMethod = BaseStructure(
    Class,
    Dict(
        :name=>:MultiMethod,
        :direct_superclasses=>[Object], 
        :direct_slots=>[
            Slot(:specializers, missing), 
            Slot(:procedure, missing), 
            Slot(:generic_function, missing)
        ],
        :class_precedence_list=>[Object, Top],
        :slots=>[
            Slot(:specializers, missing), 
            Slot(:procedure, missing), 
            Slot(:generic_function, missing)
        ]
    )
)

pushfirst!(getfield(MultiMethod, :slots)[:class_precedence_list], MultiMethod)