import Foundation



public final class Node : Hashable{
        
    public let name : String
    public var neighbor : [Node : Int]
    
    public init(_ name: String) {
        self.name = name
        self.neighbor = [:]
    }
    
    public func addNeighbor(_ node : Node ,_ value : Int){
        neighbor[node] = value
    }
    
    public static func == (lhs: Node, rhs: Node) -> Bool {
        lhs.name == rhs.name
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}
