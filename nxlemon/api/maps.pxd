cdef extern from "lemon/concepts/maps.h" namespace "lemon:concepts":
    cdef cppclass ReadMap[K, T]:
        ctypedef K Key
        ctypedef T Value

        Value operator[](Key&)

        cppclass Constraints[_ReadMap]:
            void constraints()

            Key& key

            #typename _ReadMap::Key& own_key

            _ReadMap& m
            Constraints()

    cdef cppclass WriteMap[K, T]:
        ctypedef K Key
        ctypedef T Value

        void set(Key&, Value&)

        WriteMap()

        cppclass Constraints[_WriteMap]:
            void constraints()

            Key& key
            Value& val

            #typename _WriteMap::Key& own_key
            #typename _WriteMap::Value& own_val

            _WriteMap& m
            Constraints()

    cdef cppclass ReadWriteMap[K, T](ReadMap[K, T], WriteMap[K, T]):
        ctypedef K Key
        ctypedef T Value

        Value operator[](Key&)

        void set(Key&, Value&)

        cppclass Constraints[_ReadWriteMap]:
            void constraints()

    cdef cppclass ReferenceMap[K, T, R, CR](ReadWriteMap[K, T]):
        ctypedef True ReferenceMapTag
        ctypedef K Key
        ctypedef T Value
        ctypedef R Reference
        ctypedef CR ConstReference

        Reference operator[](Key&)

        ConstReference operator[](Key&)

        void set(Key &k, Value &t)

        cppclass Constraints[_ReferenceMap]:
            #typename enable_if[_ReferenceMap::ReferenceMapTag, void]::type
            constraints()

            Key& key
            Value& val
            Reference ref
            ConstReference cref
            #typename _ReferenceMap::Key& own_key
            #typename _ReferenceMap::Value& own_val
            #typename _ReferenceMap::Reference own_ref
            #typename _ReferenceMap::ConstReference own_cref
            _ReferenceMap& m
            Constraints()

