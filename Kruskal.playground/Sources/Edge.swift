import Foundation


public struct Edge : Comparable{
            
    public let node1 : String
    public let node2 : String
    public let weight : Int
    
    public init(_ node1: String,_ node2: String,_ weight: Int) {
        self.node1 = node1
        self.node2 = node2
        self.weight = weight
    }
    
    
    public static func < (lhs: Edge, rhs: Edge) -> Bool {
        lhs.weight < rhs.weight
    }
    
}
