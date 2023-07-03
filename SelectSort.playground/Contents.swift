import Foundation




func selectSort(_ array : inout [Int]){
    
    var min : Int  = Int.max
    var minIndex : Int
    
    
    for i in 0..<(array.count-1){
        minIndex = i
        min = array[i]
        
        for j in (i + 1)..<(array.count){
            if min > array[j]{
                min = array[j]
                minIndex = j
            }

        }
        
        let temp = array[i]
        array[i] = array[minIndex]
        array[minIndex] = temp
        //array.swapAt(i, minIndex)
    }
    
}




var testArray : [Int] = [83,5,35,1,8,24,16,15,36,80,45,-2]
selectSort(&testArray)
print(testArray)
