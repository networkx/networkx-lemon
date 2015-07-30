cdef extern from "lemon/static_graph.h" namespace "lemon":
    cdef cppclass StaticDigraph:

        StaticDigraph()

        Node node(int)
        Arc arc(int)
        int index(Node)
        int index(Arc)
        int nodeNum()
        int arcNum()

        void build[Digraph, NodeRefMap, ArcRefMap](Digraph&, NodeRefMap&, ArcRefMap&)

        void build[ArcListIterator](int, ArcListIterator, ArcListIterator)

        void clear()

        cppclass OutArcIt(Arc):
            OutArcIt()
            OutArcIt(Invalid)
            OutArcIt(StaticDigraph&, Node&)
            OutArcIt(StaticDigraph&, Arc&)
            OutArcIt& operator++()

            Node baseNode(OutArcIt&)
            Node runningNode(OutArcIt&)
            Node baseNode(InArcIt&)
            Node runningNode(InArcIt&)
    
