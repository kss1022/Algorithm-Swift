import Foundation


class Node{
    let data : Int
    var childrens : [Node]
    
    
    init(_ data : Int){
        self.data = data
        childrens = []
    }
    
}


func searchDepthFirst(node : Node){
    
    var stack = [Node]()
    
    stack.append(node)
    
    while !stack.isEmpty{
        let next = stack.removeLast()
        
        print("\(next.data)")
        stack.append(contentsOf: next.childrens)
    }
}

func searchDepthFirstRecursive(node : Node){
    print("\(node.childrens)")
    node.childrens.forEach { next in
        searchDepthFirstRecursive(node: node)
    }
}




func searchBreadthFirst(node : Node){
    var queue = [Node]()
    
    queue.insert(node, at: 0)
    while !queue.isEmpty{
        let next = queue.removeFirst()
        print("\(next.data)")
        queue.append(contentsOf: next.childrens)
    }
}
