from static_graph.pxd import StaticDigraph

cdef extern from "lemon/dijkstra.h" namespace "lemon":

    cdef cppclass Dijkstra[GR, LEN, TR]:

        cppclass SetPredMapTraits[T]:
            cdef T *createPredMap(StaticDigraph&)

        cppclass SetPredMap[T]:
            ctypedef Dijkstra[StaticDigraph, TR::LengthMap, SetPredMapTraits[T] ] Create

        cppclass SetDistMapTraits[T]:
            ctypedef T DistMap
            cdef DistMap *createDistMap(StaticDigraph&)

        cppclass SetDistMap[T]:
            ctypedef Dijkstra[StaticDigraph, TR::LengthMap, SetDistMapTraits[T] ]

        cppclass SetProcessedMapTraits[T]:
            ctypedef T ProcessedMap
            cdef ProcessedMap *createProcessedMap(Digraph&)

        cppclass SetProcessedMap[T]:
            ctypedef Dijkstra[StaticDigraph, TR::LengthMap, SetProcessedMapTraits[T] ] Create

        cppclass SetStandardProcessedMapTraits(T):
            ctypedef typename StaticDigraph NodeMap[bool] ProcessedMap
            cdef ProcessedMap *createProcessedMap(Digraph&)

        cppclass SetStandardProcessedMap(T):
            ctypedef Dijkstra[StaticDigraph, TR::LengthMap, SetStandardProcessedMapTraits[T] ] Create

        cppclass SetHeapTraits[H, CR](T):
            ctypedef CR HeapCrossRef
            ctypedef H Heap
            cdef HeapCrossRef *createHeapCrossRef(StaticDigraph&)
            cdef Heap *createHeap(HeapCrossRef&)

        cppclass SetHeap[H, CR]:
            ctypedef Dijkstra[StaticDigraph, TR::LengthMap, SetHeapTraits[H, CR] ] Create

        cppclass SetStandardHeapTraits[H, CR]:
            ctypedef CR HeapCrossRef
            ctypedef H Heap
            cdef HeapCrossRef *createHeap(HeapCrossRef&)

        cppclass SetStandardHeap[H, CR]:
            ctypedef Dijkstra[StaticDigraph, TR::LengthMap, SetStandardHeapTraits[H, CR] ] Create

        cppclass SetOperationTraitsTraits[T]:
            ctypedef T SetOperationTraitsTraits

        cppclass SetOperationTraits[T]:
            ctypedef Dijkstra[StaticDigraph, TR::LengthMap, SetOperationTraitsTraits[H, CR] ] Create



        Dijkstra(StaticDigraph&, TR::LengthMap&)
            
            # Not sure whether to add them or not
            #cdef G &g
            #cdef _length &length
            #cdef *_pred = NULL
            #cdef bint local_pred = false
            #cdef *_dist = NULL
            #cdef bint local_dist = false
            #cdef *_processed = NULL
            #cdef bint local_processed = false
            #cdef *_heap_cross_ref = NULL
            #cdef bint local_heap_cross_ref = false
            #cdef *_heap = NULL
            #cdef bint local_heap = false

        Dijkstra &lengthMap(TR::LengthMap&)

        Dijkstra &predMap(TR::PredMap&)

        Dijkstra &distMap(TR::DistMap&)

        Dijkstra &heap(Heap&, HeapCrossRef&)


        void init()
        void addSource(Node, Value)
        Node processNextNode()
        Node nextNode()
        bint emptyQueue()
        int queueSize()
        void Start()
        void Start(Node)

        Node Start[NodeBoolMap]:
            Node start(NodeBoolMap&)

        void run(Node)
        bint run(Node, Node)
        Path path(Node)
        Value dist(Node)
        Arc predArc(Node)
        Node predNode(Node)
        DistMap &distMap()
        PredMap &PredMap()
        bint reached(Node)
        bint processed(Node)
        Value currentDist(Node)


