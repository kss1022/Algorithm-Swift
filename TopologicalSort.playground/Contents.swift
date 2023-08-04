import Foundation


class Node : Hashable{
    
    let title : String
    var neighbors : [Node]
    
    init(_ title : String){
        self.title = title
        self.neighbors = [Node]()
    }
    
    
    func append(_ neighbor : Node){
        self.neighbors.append(neighbor)
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
    
    static func == (lhs: Node, rhs: Node) -> Bool {
        lhs.title == rhs.title
    }
    
}


func topologicalSort(graph : [Node]) -> [Node]{
    var discovered = Set<Node>()
    var sorted = [Node]()
    
    for node in graph{
        if discovered.contains(node){ continue}
        
        topologicalSortRecursive(
            node: node,
            discovered: &discovered,
            sorted: &sorted
        )
    }
    
    
    return sorted
}

//postOrder
func topologicalSortRecursive(
    node : Node,
    discovered : inout Set<Node>,
    sorted : inout [Node]
){
    discovered.insert(node)
    
    for neighbor in node.neighbors{
        if discovered.contains(neighbor){ continue }
        
        topologicalSortRecursive(node: neighbor, discovered: &discovered, sorted: &sorted)
    }
    
    //위상정렬은 정렬후 reverse 해야하기 때문에 맨 앞에 넣는다
    sorted.insert(node, at: 0)
}



func createGraph() -> [Node]{
    let node0000 = Node("0000");
    let node1500 = Node("1500");
    let node1000 = Node("1000");
    let node1600 = Node("1600");
    let node2200 = Node("2200");
    let node2500 = Node("2500");
    let node4700 = Node("4700");
    let node2300 = Node("2300");
    let node3200 = Node("3200");
    let node3500 = Node("3500");
    let node3000 = Node("3000");
    let node4000 = Node("4000");
    let node4100 = Node("4100");
    
    
    node0000.append(node1500);
    
    node1500.append(node1000);
    node1500.append(node1600);
    node1500.append(node2200);
    node1500.append(node2500);
    
    node1000.append(node1600);
    node1000.append(node2200);
    node1000.append(node2500);
    
    node1600.append(node4700);
    
    node2200.append(node2300);
    node2200.append(node3200);
    node2200.append(node3000);
    
    node2500.append(node4700);
    node2500.append(node3200);
    node2500.append(node3500);
    
    node2300.append(node3000);
    
    node3200.append(node4000);
    node3200.append(node4100);
    
    node3000.append(node4000);
    
    
    var graph = [Node]()
        
    graph.append(node0000);
    graph.append(node1000);
    graph.append(node1500);
    graph.append(node1600);
    graph.append(node2200);
    graph.append(node2300);
    graph.append(node2500);
    graph.append(node3000);
    graph.append(node3200);
    graph.append(node3500);
    graph.append(node4000);
    graph.append(node4100);
    graph.append(node4700);
    return graph
}


let graph = createGraph()
let sorted = topologicalSort(graph: graph)

sorted.forEach {
    print($0.title)
}


let shuffledGraph = graph.shuffled()

let shuffledSorted = topologicalSort(graph: shuffledGraph)

print("------------------shuffled----------------")
shuffledSorted.forEach {
    print($0.title)
}
