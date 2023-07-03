import Foundation




//func binarySearch(value : Int,  array : [Int]) -> Int{
//    return binarySearch(value: value, array: array, left: 0, right: array.count - 1)
//}
//
//func binarySearch(value : Int,  array : [Int] ,left : Int , right : Int) -> Int{
//    if right < left{
//        return -1
//    }
//
//
//    var mid = (left + right) / 2
//    if array[mid] == value{
//        return mid
//    }
//
//    if value > array[mid]{
//        return binarySearch(value: value, array: array, left: mid + 1 , right: right)
//    }else{
//        return binarySearch(value: value, array: array, left: left, right: mid - 1)
//    }
//}
//
//let array = [1 ,2 ,3 ,5 , 6 ,8 , 10 , 15, 19 , 22, 23 ,43 , 53]
//
//let index = binarySearch(value: 4, array: array)
//print(index)



//회전된 배열에서의 탐색
func indexOfRoatedSearch(value : Int,  array : [Int]) -> Int{
    return indexOfRoatedSearch(value: value, array: array, left: 0, right: array.count - 1)
}


func indexOfRoatedSearch(value : Int,  array : [Int] , left : Int , right : Int) -> Int{
    if right < left{
        return -1
    }
    
    
    var mid = (left + right) / 2
    if array[mid] == value{
        return mid
    }
    
    
    
    //left ~ mid까지 정렬된 경우
    if array[left] <= array[mid]{
        if value < array[mid] && value >= array[left]{
            return indexOfRoatedSearch(value: value, array: array, left: left, right: mid - 1)
        }else{
            return indexOfRoatedSearch(value: value, array: array, left: mid + 1 , right: right)
        }
    }
    
    //mid ~ end까지 정렬된 경우
    if value >= array[mid] && value <= array[right]{
        return indexOfRoatedSearch(value: value, array: array, left: mid + 1, right: right)
    }else{
        return indexOfRoatedSearch(value: value, array: array, left: left , right: mid - 1)
    }
}

let roatedArrat = [ 20 ,25 , 26, 29 ,33 ,1 , 3, 5, 6 , 10, 11 , 13 , 19]
//[ 33 ,1 , 3, 5, 6 , 10, 11 , 13 , 19]
//[ 5, 6 ,26,  29  ,33 ,1 , 3]
let index = indexOfRoatedSearch(value: 20, array: roatedArrat)
print(13)
