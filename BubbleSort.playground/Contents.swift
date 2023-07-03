import Foundation




func bubbleSort(_ array : inout [Int]){
    for i in 0..<(array.count-1){
        for j in 0..<(array.count - i - 1){
            if array[j] > array[j + 1]{
                let temp = array[j + 1]
                array[j + 1] = array[j]
                array[j] = temp
                //array.swapAt(j, j + 1)
            }
        }
    }
}




var testArray : [Int] = [83,5,35,1,8,24,16,15,36,80,45,-2]
bubbleSort(&testArray)
print(testArray)
