import Foundation



func insertSort(_ input : inout [Int]){
    for i in 0..<input.count{
        //for j in i..input
//        var valueIndex = i
        
//        for j in (0..<i).reversed(){
//            if input[j] > input[valueIndex]{
//                input.swapAt(j, valueIndex)
//                valueIndex = j
//            }
//        }
        
        
        //        for j in stride(from:  i - 1, to: -1, by: -1){
        //            if input[j] > input[valueIndex]{
        //                input.swapAt(j, valueIndex)
        //                valueIndex = j
        //            }
        //        }
        
        
        var index = i
        var value = input[i]
        
        var j = i - 1
        while  j >= 0 && input[j] > value{
            input.swapAt(j, index)
            index = j
            j -= 1
        }

        
        print(input)
    }
}





var testSort : [Int] = [83,5,35,1,8,24,16,15,36,80,45,-2]
insertSort(&testSort)
print(testSort)
