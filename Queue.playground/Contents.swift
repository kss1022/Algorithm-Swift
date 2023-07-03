import Foundation


//FIFO

class Queue{
    var array : [Int]
    var front : Int
    var back : Int
    var maxLength : Int
    
    init(){
        self.array = [Int]()
        self.maxLength = 10
        self.front = 0
        self.back = 0
        
        array.reserveCapacity(maxLength)
        
        
        for i in 0..<maxLength{
            array.append(-99)
        }
    }
    
    func search(_ value : Int) -> Int{
        let find = array.enumerated()
            .first{ $0.element ==  value }
            .map { $0.offset }
        
        
        if find == nil{
            return -1
        }
        
        return find!
    }
    
    func isFull() -> Bool{
        (back + 1) % maxLength == front
    }
    
    func isEmpty() -> Bool{
        front == back
    }
    
    func enQueue(_ value : Int){
        if isFull(){
            print("isFull! Front / Back \(front) / \(back)")
            return
        }
                
        back = ( back + 1 ) % maxLength
        array[back] = value
        print(array)
    }
    
    func deQueue() -> Int{
        if isEmpty(){
            print("isEmpty!  Front / Back \(front) / \(back)")
            return -1
        }
                        
        front = ( front + 1 ) % maxLength
        let temp = array[front]
        array[front] = -1
        print(array)
        return temp
    }
    

}

let queue = Queue()



for i in 0..<13{
    queue.enQueue(i)
}


print("------------pop------------")
for _ in 0..<15{
    queue.deQueue()
}

