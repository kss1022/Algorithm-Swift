import Foundation


class Node{
    var value : Int
    var left : Node?
    var right : Node?
    
    init(value : Int){
        self.value = value
    }
    
    
    
    static func getNodeOrNull( node : Node? , value : Int) -> Node?{
        guard let node = node else { return nil}

        if node.value == value{
            return node
        }
                
        if value < node.value{
            return getNodeOrNull(node: node.left, value: value)
        }
        
        return getNodeOrNull(node: node.right, value: value)
    }



    static func insertRecursive( node : Node? , value : Int) -> Node?{
        guard let node = node else { return Node(value: value) }
        
        if value < node.value{
            node.left = insertRecursive(node: node.left, value: value)
        }else{
            node.right = insertRecursive(node: node.right, value: value)
        }
                
        return node
    }

    
    static func deleteRecursive( node : Node? , value : Int){
        
        var parent : Node? = node
        var current : Node? = node
        var find : Node?
        
        while parent != nil || current != nil{
            if value == current!.value{
                find = current
                break
            }
            
            if value < current!.value{
                parent = current
                current = current?.left
            }else{
                parent = current
                current = current?.right
            }
        }
        
        
        guard let parent = parent,
              let find = find else {
            print("값을 찾지 못했습니다.")
            return
        }
        
        print("값을 찾았습니다. find : \(find.value)  parent : \(parent.value)")
        
        if find.left == nil && find.right == nil{
            //find -> leaf
            if parent.value == find.value{
                print("마지막 노드입니다!!!")
                return
            }
            
            if parent.left?.value == find.value{
                parent.left = nil
            }else{
                parent.right = nil
            }
            
            return
        }
        
        
        if find.left == nil{
            //child - 1   parent->child = find.child
            if parent.left?.value == find.value{
                parent.left = find.right
            }else{
                parent.right = find.right
            }
        }else if find.right == nil{
            if parent.left?.value == find.value{
                parent.left = find.left
            }else{
                parent.right = find.left
            }
            return
        }
        

        guard var childNode = find.left else { return }
        var childNodeParent = find
        
        while childNode.right != nil{
            childNodeParent = childNode
            childNode = childNode.right!
        }
        
        
        print("값을 찾았습니다. childNode : \(childNode.value)  childNodeParent : \(childNodeParent.value)")

        
        
        
        if childNode.left == nil{
            //childNode -> leafNode
            //값을 교체한후 leafNode를 삭제한다.
            find.value = childNode.value

            if childNodeParent.left?.value == childNode.value{
                childNodeParent.left = nil
            }else{
                childNodeParent.right = nil
            }

            return
        }else{
            find.value = childNode.value
            
            if childNodeParent.left?.value == childNode.value{
                childNodeParent.left = childNode.left
            }else{
                childNodeParent.right = childNode.left
            }
        }
    }
    
    static func travleInOrderRecursive(node : Node?){
        guard let node = node else { return }
                        
        travleInOrderRecursive(node: node.left)
        print(node.value)
        travleInOrderRecursive(node: node.right)
    }

    
    static func travelPreOrderRecursive(node : Node?){
        guard let node = node else { return }
        
        print(node.value)
        travelPreOrderRecursive(node: node.left)
        travelPreOrderRecursive(node: node.right)
    }
    
    
    static func travePreOrder(node : Node){
        var stack = [Node]()
        
        stack.append(node)
        
        while !stack.isEmpty{
            let mid = stack.removeLast()
            print(mid.value)
         
            if let right = mid.right{
                stack.append(right)
            }
            
            if let left = mid.left{
                stack.append(left)
            }
        }
    }
    
    static func travelPostOrderRecursive(node : Node?){
        guard let node = node else { return }
                
        travelPostOrderRecursive(node: node.left)
        travelPostOrderRecursive(node: node.right)
        print(node.value)
    }
 
    
    static func copyRecursive(node : Node?) -> Node?{
        guard let node = node else { return nil }
        let newNode = Node(value: node.value)
        newNode.left = copyRecursive(node: node.left)
        newNode.right = copyRecursive(node: node.right)
        return newNode
    }
}



let root = Node(value: 6)

Node.insertRecursive(node: root, value: 4)
Node.insertRecursive(node: root, value: 10)

Node.insertRecursive(node: root, value: 2)
Node.insertRecursive(node: root, value: 5)
Node.insertRecursive(node: root, value: 8)
Node.insertRecursive(node: root, value: 15)

Node.insertRecursive(node: root, value: 1)
Node.insertRecursive(node: root, value: 3)
Node.insertRecursive(node: root, value: 7)
Node.insertRecursive(node: root, value: 9)
Node.insertRecursive(node: root, value: 12)


//Node.deleteRecursive(node: root, value: 10)
//Node.deleteRecursive(node: root, value: 9)

//Node.travleInOrderRecursive(node: root)
//Node.travePreOrder(node: root)
//Node.travelPreOrderRecursive(node: root)
//Node.travelPostOrderRecursive(node: root)




let copyNode = Node.copyRecursive(node: root)

Node.travelPostOrderRecursive(node: root)
print("-------------Copy-------------")
Node.travelPostOrderRecursive(node: copyNode)

root.left?.value = Int.max
print("Change root Value")
print(root.left?.value)
print(copyNode?.left?.value)

//print(root.value)
//print(root.left?.value)
//print(root.right?.value)
//
//print(root.left?.left?.value)
//print(root.left?.right?.value)
//
//print(root.right?.left?.value)
//print(root.right?.right?.value)
//
//print(root.left?.left?.left?.value)
//print(root.left?.left?.right?.value)
//
//print(root.right?.left?.left?.value)
//print(root.right?.left?.right?.value)
//
//print(root.right?.right?.left?.value)


