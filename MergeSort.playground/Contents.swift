import Foundation




func mergeArray(_ a : [Int] , _ b : [Int]) -> [Int]{
    
    var newArray = [Int]()
        
    var i = 0
    var j = 0
    
    while i < a.count  && j < b.count {
        if a[i] < b[j]{
            newArray.append(a[i])
            i += 1
        }else{
            newArray.append(b[j])
            j += 1
        }
    }
        
    if i < a.count {
        for k in i..<a.count{
            newArray.append(a[k])
        }
    }else{
        for k in j..<b.count{
            newArray.append(b[k])
        }
    }
            
    return newArray
}



var array = [1,2,5,7]
var array2 = [3,4,6,7,8]
var merge = mergeArray(array, array2)
print(merge)



func mergeSort(_ array : [Int]) -> [Int]{
    mergeSortRecursive(array: array)
}

func mergeSortRecursive(array : [Int]) -> [Int]{
    if array.count < 2{
        print("return \(array)")
        return array
    }
    
        
    let mid = array.count / 2
    let slice = array[0..<mid]
    
    var left = mergeSortRecursive(array: array[0..<mid].map{$0} )
    var right = mergeSortRecursive(array: array[mid..<array.count].map{$0} )
    let merge = mergeArray(left, right)
    print("\(left) + \(right) =  \(merge)")
    return merge
}

print("-----------MergeSortprint-----------")
var testArray = [7,6,5,8,3,5,9,1]
let result = mergeSort(testArray)
print(result)


