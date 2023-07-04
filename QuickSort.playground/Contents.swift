import Foundation


func quickSort(_ array : inout [Int]){
    if array.isEmpty{
        return
    }
    
    quickSortRecursive(array: &array, left: 0, right: array.count - 1)
}

func quickSortRecursive(array : inout [Int], left : Int , right : Int){
    if left >= right{
        return
    }
    
    let pivotPost = partition2(array: &array, left: left, right: right)
    quickSortRecursive(array: &array, left: left, right: pivotPost - 1)
    quickSortRecursive(array: &array, left: pivotPost + 1, right: right)
}

//  Lomuto(로무토) 분할법 : left -> right , 보통 가장자리 값을 기준값으로 선택할 때 잘 작동
//  Hoare(호어) 분할법 : left -> right, left <- right , 어떤 값을 기준으로 해도  잘 작동
func partition(array : inout [Int], left : Int , right : Int) -> Int{
    let pivot = array[right]
    
    var i = left - 1

    for j in left..<right{
        if array[j] < pivot{
            i += 1
            array.swapAt(i, j)
        }
    }

    let pivotPos = i + 1
    array.swapAt(pivotPos ,right)
    
    return pivotPos
}


func partition2(array : inout [Int], left : Int , right : Int) -> Int{0
    let pivot = array[left]
    var i = left - 1
    var j = right + 1

    while i < j{
        repeat{
            i += 1
        }while array[i] < pivot
        
        repeat{
            j -= 1
        }while array[j] > pivot
                
    
        if i < j{
            array.swapAt(i , j)
        }
    }
            
    return j
}


var testArray : [Int] = [83,5,35,1,8,24,16,15,36,80,45,-2]
quickSort(&testArray)
print(testArray )
