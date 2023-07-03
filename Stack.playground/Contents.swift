import Foundation

var greeting = "Hello, playground"


//LIFO
class Stack{
    
    var array : [Int]
    var maxSize : Int
    var top : Int
    
    
    
    init(){
        self.maxSize = 10
        self.top = -1
        self.array = Array.init(repeating: -1, count: maxSize)
    }
    
    func search(_ value : Int) -> Int{
        for i in array.enumerated(){
            i.element == value
            return i.offset
        }
        
        return -1
    }
    
    func push(_ value : Int){
        if top == maxSize - 1 {
            print("stack overflow")
            return
        }
                
        top += 1
        array[top] = value
        
        print(array)
    }
    
    func pop() -> Int{
        if top == -1{
            print("stack is Empty")
            return -1
        }
        
        let temp = array[top]
        array[top] = -1
        top -= 1
        print(array)
        return temp
    }

    
}



let stack = Stack()

for i in 0...10{
    stack.push( i + 1)
}

repeat{
    stack.pop()
}while stack.top != -1
