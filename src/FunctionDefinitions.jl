export GenericFunction, MultiMethod

GenericFunction = BaseStructure(
    Class,
    Dict(
        :name=>:GenericFunction,
        :direct_superclasses=>[Object], 
        :direct_slots=>[
            SlotDefinition(:name, missing), 
            SlotDefinition(:lambda_list, missing), 
            SlotDefinition(:methods, missing)
        ],
        :class_precedence_list=>[Object, Top],
        :slots=>[
            SlotDefinition(:name, missing), 
            SlotDefinition(:lambda_list, missing), 
            SlotDefinition(:methods, missing)
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
            SlotDefinition(:specializers, missing), 
            SlotDefinition(:procedure, missing), 
            SlotDefinition(:generic_function, missing)
        ],
        :class_precedence_list=>[Object, Top],
        :slots=>[
            SlotDefinition(:specializers, missing), 
            SlotDefinition(:procedure, missing), 
            SlotDefinition(:generic_function, missing)
        ]
    )
)

pushfirst!(getfield(MultiMethod, :slots)[:class_precedence_list], MultiMethod)