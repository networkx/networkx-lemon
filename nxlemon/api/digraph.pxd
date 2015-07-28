cdef extern from "lemon/concepts/digraph.h" namespace "lemon:concepts":
    cdef cppclass Digraph:
        Digraph()

        # Node class of Digraph
        cppclass Node:
            Node()
            Node(Node&)
            Node(Invalid)
            bint operator==(Node)
            bint operator!=(Node)
            bint operator<(Node)

        # Iterator class for nodes
        cppclass NodeIt(Node):
            NodeIt()
            NodeIt(NodeIt&)
            NodeIt(Invalid)
            NodeIt(Digraph&)
            NodeItD(Digraph&, Node&)
            NodeIt& operator++()

        # Arc class of Digraph
        cppclass Arc:
            Arc()
            Arc(Arc&)
            Arc(Invalid)
            bint operator==(Arc)
            bint operator!=(Arc)
            bint operator<(Arc)

        # Iterator class for the outgoing arcs of a node.
        cppclass OutArcIt(Arc):
            OutArcIt()
            OutArcIt(OutArcIt&)
            OutArcIt(Invalid)
            OutArcIt(Digraph&, Node&)
            OutArcIt(Digraph&, Arc&)
            OutArcIt& operator++()

        # Iterator class for the incoming arcs of a node
        cppclass InArcIt(Arc):
            InArcIt()
            InArcIt(InArcIt&)
            InArcIt(Invalid)
            InArcIt(Digraph&, Node&)
            InArcIt(Digraph&, Arc&)
            InArcIt& operator++()

        # Iterator class for the arcs
        cppclass ArcIt(Arc):
            ArcIt()
            ArcIt(ArcIt&)
            ArcIt(Invalid)
            ArcIt(Digraph&)
            ArcIt(Digraph&, Arc&)
            ArcIt& operator++()


        # Source node of the arc
        Node source(Arc)

        # Target node of the arc
        Node target(Arc)

        # ID of the node
        int id(Node)

        # ID of the Arc
        int id(Arc)

        # Node with the ID given
        Node nodeFromId(int)

        # Arc with the ID given
        Arc arcFromId(int)

        # Maximum value of node ID
        int maxNodeId

        # Maximum value of arc ID
        int maxArcId()

        void first(Node&)
        void next(Node&)

        void first(Arc&)
        void next(Arc&)


        void firstIn(Arc&, Node&)
        void nextIn(Arc&)

        void firstOut(Arc&, Node&)
        void nextOut(Arc&)

        # Dummy Parameters
        Node fromId(int, Node)
        Arc fromId(int, Arc)
        int maxId(Node)
        int maxId(Arc)

        # Opposite node on the given arc
        Node oppositeNode(Node, Arc)

        # Base node of the given iterator
        Node baseNode(OutArcIt)

        # Running node of the given iterator
        Node runningNode(OutArcIt)

        # Base node of the given iterator
        Node baseNode(InArcIt)

        # Running node of the given iterator
        Node runningNode(InArcIt)

        # NOTE: To wrap the next part, "ReferenceMap" class from 
        # lemon/concepts/maps.h needs to be cimported and used here.

        
        #template<class T>
        #class NodeMap : public ReferenceMap<Node, T, T&, const T&> {
        #public:

        #explicit NodeMap(const Digraph&) { }

        #NodeMap(const Digraph&, T) { }

        #private:

        #NodeMap(const NodeMap& nm) :
        #  ReferenceMap<Node, T, T&, const T&>(nm) { }

        #template <typename CMap>
        #NodeMap& operator=(const CMap&) {
        #  checkConcept<ReadMap<Node, T>, CMap>();
        #  return *this;
        #}
        #};

        #template<class T>
        #class ArcMap : public ReferenceMap<Arc, T, T&, const T&> {
        #public:

        #explicit ArcMap(const Digraph&) { }

        #ArcMap(const Digraph&, T) { }

        #private:
        #ArcMap(const ArcMap& em) :
        #  ReferenceMap<Arc, T, T&, const T&>(em) { }
        #template <typename CMap>
        #ArcMap& operator=(const CMap&) {
        #  checkConcept<ReadMap<Arc, T>, CMap>();
        #  return *this;
        #}
        #};

        #template <typename _Digraph>
        #struct Constraints {
        #void constraints() {
        #  checkConcept<BaseDigraphComponent, _Digraph>();
        #  checkConcept<IterableDigraphComponent<>, _Digraph>();
        #  checkConcept<IDableDigraphComponent<>, _Digraph>();
        #  checkConcept<MappableDigraphComponent<>, _Digraph>();
        #}
        #};
        
