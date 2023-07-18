import Foundation



final class Quadrant{
    private static let MIN_QUAD_DIMENSION = 2;
    
    
    private let boundingRect : BoundingRect;
    
    private var topLeft : Quadrant?
    private var topRight : Quadrant?
    private var bottomLeft : Quadrant?
    private var bottomRight :Quadrant?
    
    private var gameObjects = [GameObject]()
    
    init(boundingRect : BoundingRect){
        self.boundingRect = boundingRect
        createChildren()
    }
    
    
    
    func insert( gameObject : GameObject) -> Bool{
        
        let position = gameObject.getPosition()
        
        if !boundingRect.contains(point: position){
            return false
        }
        
        gameObjects.append(gameObject)
        
        if topLeft != nil{
            topLeft?.insert(gameObject: gameObject)
            topRight?.insert(gameObject: gameObject)
            bottomLeft?.insert(gameObject: gameObject)
            bottomRight?.insert(gameObject: gameObject)
        }
        
        return true
    }
    
    
    func getGameObjects( react : BoundingRect) -> [GameObject]{
        if !boundingRect.contains(other: react){
            return []
        }
        
        //Current Leaf Node
        if topLeft == nil{
            return gameObjects
        }
        
        
        if topLeft!.boundingRect.contains(other: react){

            return topLeft!.getGameObjects(react: react)
        }
        
        if topRight!.boundingRect.contains(other: react){
            return topRight!.getGameObjects(react: react)
        }
        
        if bottomLeft!.boundingRect.contains(other: react){
            return bottomLeft!.getGameObjects(react: react)
        }
        
        if bottomRight!.boundingRect.contains(other: react){
            return bottomRight!.getGameObjects(react: react)
        }
        
        return gameObjects
    }
    
    
    
    
    
    
    
    
    
    private func createChildren(){
        let width = boundingRect.width
        let height = boundingRect.height
        
        if width < 2 * Quadrant.MIN_QUAD_DIMENSION ||
            height < 2 * Quadrant.MIN_QUAD_DIMENSION{
            //나눌수 없는 경우
            return
        }
        
        let x1 = boundingRect.getTopLeft().x
        let y1 = boundingRect.getTopLeft().y
        
        let x2 = boundingRect.getBottomRight().x
        let y2 = boundingRect.getBottomRight().y
        
        let midX = (x1 + x2) / 2
        let midY = (y1 + y2) / 2

        let newWidth = width / 2
        let newHeight = height / 2
        
        
        
        let topLeftReact = BoundingRect(
            topLeft: Point(x: x1, y: y1),
            widht: midX - x1,
            height: midY - y1
        )
        
        let topRightReact = BoundingRect(
            topLeft: Point(x: midX, y: y1),
            widht: x2 - midX,
            height: midY - y1
        )
        
        let bottomLeftReact = BoundingRect(
            topLeft: Point(x: x1, y: midY),
            widht: midX - x1,
            height: y2 - midY
        )
        
        let bottomRightReact = BoundingRect(
            topLeft: Point(x: midX, y: midY),
            widht: x2 - midX,
            height: y2 - midY
        )
        
        
        self.topLeft = Quadrant(boundingRect: topLeftReact)
        self.topRight = Quadrant(boundingRect: topRightReact)
        self.bottomLeft = Quadrant(boundingRect: bottomLeftReact)
        self.bottomRight = Quadrant(boundingRect: bottomRightReact)
    }
    
    
    
    
}

struct BoundingRect{
    
    let topLeft : Point
    let bottonRight : Point
    let width : Int
    let height : Int
    
    init(topLeft : Point , widht : Int , height : Int){
        self.topLeft = topLeft
        self.width = widht
        self.height = height
        self.bottonRight = Point(x: topLeft.x + widht, y: topLeft.y + height)
    }
    
    func getTopLeft() -> Point{
        topLeft
    }
    
    func getTopRight() -> Point{
        Point(x: bottonRight.x, y: topLeft.y)
    }
    
    func getBottomLeft() -> Point{
        Point(x: topLeft.x, y: bottonRight.y)
    }
    
    func getBottomRight() -> Point{
        bottonRight
    }
    
    
    func contains(point : Point) -> Bool{
        (point.x >= topLeft.x) &&
        (point.y >= topLeft.y) &&
        (point.x <= bottonRight.x) &&
        (point.y <= bottonRight.y)
    }
    
    func contains(other : BoundingRect) -> Bool{
        
        self.topLeft.x <= other.topLeft.x &&
        self.bottonRight.x >= other.bottonRight.x &&
        
        self.topLeft.y <= other.topLeft.y &&
        self.bottonRight.y >= other.bottonRight.y

        return true
    }
}




struct GameObject{
    let data : Int
    let point : Point
    
    func getPosition() -> Point{
        point
    }
    
}

struct Point{
    let x : Int
    let y : Int
}



let p1 = Point(x: 1, y: 1)
let g1 = GameObject(data: 1, point: p1)

let p2 = Point(x: 7, y: 9)
let g2 = GameObject(data: 2, point: p2)

let p3 = Point(x: 5, y: 5)
let g3 = GameObject(data: 3, point: p3)

let p4 = Point(x: 3, y: 4)
let g4 = GameObject(data: 4, point: p4)

let p5 = Point(x: 2, y: 7)
let g5 = GameObject(data: 5, point: p5)

let p6 = Point(x: 9, y: 3)
let g6 = GameObject(data: 6, point: p6)



let rootPoint = Point(x: 0, y: 0)
let rootReact = BoundingRect(topLeft: rootPoint, widht: 10, height: 10)

let root = Quadrant(boundingRect: rootReact)
root.insert(gameObject: g1)
root.insert(gameObject: g2)
root.insert(gameObject: g3)
root.insert(gameObject: g4)
root.insert(gameObject: g5)
root.insert(gameObject: g6)



let aP1 = Point(x: 0, y: 1)
let aR1 = BoundingRect(topLeft: aP1, widht: 4, height: 3)
let a = root.getGameObjects(react: aR1)

a.forEach {
    print($0.data)
}
