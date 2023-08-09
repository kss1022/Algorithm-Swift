import Foundation



public final class Candidate : Comparable{
        
    public let node : Node
    public let distance : Int
    
    public init(_ node: Node,_ distance: Int) {
        self.node = node
        self.distance = distance
    }
    
    public static func < (lhs: Candidate, rhs: Candidate) -> Bool {
        lhs.distance < rhs.distance
    }
    
    public static func == (lhs: Candidate, rhs: Candidate) -> Bool {
        lhs.node.name == rhs.node.name
    }
        
}
