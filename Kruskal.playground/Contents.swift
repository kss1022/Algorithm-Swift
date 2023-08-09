import Foundation


func kruskal( nodes : [String] , edges : [Edge]) -> [Edge]{
    
    var mst = [Edge]()
    mst.reserveCapacity(nodes.count)
    let disjointSet = DisjointSet(nodes: nodes)
    var sorted = edges.sorted()
    
    for edge in sorted {
        edge.node1
        edge.node2
        
        let root1 = disjointSet.find(node: edge.node1)
        let root2 = disjointSet.find(node: edge.node2)
        
        
        if root1 != root2{
            mst.append(edge)
            disjointSet.union(node1: edge.node1, node2: edge.node2)
        }
    }
    
    return mst
}


let nodes = ["0", "1", "2", "3", "4", "5", "6", "7"]
let edges = [
    Edge("0", "4", 9),
    Edge("0", "5", 2),
    Edge("0", "2", 2),
    Edge("1", "4", 6),
    Edge("1", "5", 10),
    Edge("2", "5", 1),
    Edge("2", "7", 11),
    Edge("2", "3", 5),
    Edge("5", "7", 8),
    Edge("5", "4", 3),
    Edge("6", "7", 13)
]


let mst = kruskal( nodes: nodes , edges: edges)

mst.forEach {
    print("\($0)")
}
