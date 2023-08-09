import Foundation



public final class DisjointSet{
    
    
    private final class SetNode {
        var parent : String
        var size : Int
        
        init(parent: String, size: Int) {
            self.parent = parent
            self.size = size
        }
    }
    
    private var sets = [String: SetNode]()
    
    public init(nodes : [String]) {
        nodes.forEach {
            let node = SetNode(parent: $0, size: 1)
            sets[$0] = node
        }
    }
    
    public func find(node : String) -> String{
        assert(sets[node] != nil)
        
        let setNode = sets[node]!
        let parent = setNode.parent
                
        if parent == node{
            return node
        }
        
        setNode.parent = find(node: setNode.parent)
        return setNode.parent
    }
    
    public func union(node1 : String, node2 : String){
        assert(sets[node1] != nil )
        assert(sets[node2] != nil)
        
        let root1 = find(node: node1)
        let root2 = find(node: node2)
        
        if root1 == root2{
            //이미 같은 sets
            return
        }
        
        var parent = sets[root1]!
        var child = sets[root2]!
        
        if parent.size < child.size{
            let temp = parent
            parent = child
            child = temp
        }
                                
        child.parent = parent.parent
        parent.size = parent.size + child.size                
    }

}
