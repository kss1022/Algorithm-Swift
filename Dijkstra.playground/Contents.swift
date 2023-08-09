import Foundation





func dijstra( nodes : [String: Node], from : String,prevs : inout [String: String]) -> [String : Int]{
    var minDists = [String: Int]()
        
    nodes.forEach { node in
        let key = node.key
        minDists[key] = Int.max
    }
    
    minDists[from] = 0
    
    var open = PriorityQueue<Candidate>()
    
    let node = nodes[from]!
    var candiate = Candidate(node, 0)
    open.push(candiate)
    
    while(!open.isEmpty){
        candiate = open.pop()!
        
        let n = candiate.node
        
        let minDist = minDists[n.name]!
        let dist = candiate.distance
        
        //이전 거리보다 긴 경우 continue
        if minDist < dist{
            continue
        }
        
        let neighbors = n.neighbor
                
        for (neighbor, value) in neighbors{
            let newDistance = minDist + value
            let nextMinDist = minDists[neighbor.name] ?? Int.max
            
            if newDistance >= nextMinDist{
                continue
            }
            
            //nextMinDist
            minDists[neighbor.name] = newDistance
            prevs[neighbor.name] = n.name
            
            let newCandiate = Candidate(neighbor, value)
            open.push(newCandiate)
        }
    }
    
    
    return minDists
}



func createGraph() -> [String: Node]{
    let home =  Node("Home");
    let policeStation =  Node("Police Station");
    let school =  Node("School");
    let park =  Node("Park");
    let bank =  Node("Bank");
    let library =  Node("Library");
    
    home.addNeighbor(policeStation, 2);
    policeStation.addNeighbor(home, 2);
    
    home.addNeighbor(park, 3);
    park.addNeighbor(home, 3);
    
    policeStation.addNeighbor(bank, 1);
    bank.addNeighbor(policeStation, 1);
    
    policeStation.addNeighbor(school, 6);
    school.addNeighbor(policeStation, 6);
    
    bank.addNeighbor(library, 2);
    library.addNeighbor(bank, 2);
    
    bank.addNeighbor(park, 2);
    park.addNeighbor(bank, 2);
    
    school.addNeighbor(library, 1);
    library.addNeighbor(school, 1);
    
    var nodes = [String: Node]()
    
    nodes[home.name] = home
    nodes[policeStation.name] = policeStation
    nodes[school.name] = school
    nodes[park.name] = park
    nodes[bank.name] = bank
    nodes[library.name] = library
    
    return nodes;
}



let graph = createGraph()
var prevs = [String: String]()
let minDists = dijstra(nodes : graph , from : "Home" , prevs : &prevs)


print("HomeDist = \(minDists["Home"]!)")
print("BankDist = \(minDists["Bank"]!)")
print("LibraryDist = \(minDists["Library"]!)")

var path = [String]()
var name : String? = "School"

while(name != nil){
    path.insert(name!, at: 0)
    name = prevs[name!]
}

let pathString = path.joined(separator: "->")
print(pathString)
