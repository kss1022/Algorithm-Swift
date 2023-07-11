import Foundation


/**
 *  배열 요소의 최소 차이 찾기
 *  정렬을 사용하지 않으면 모든 두 쌍의 차이를 구해준다. -> O(n^2)
 *
 *  정렬 :O(nlogn) 정렬를 하게 되면 O(nlogn) 이된다.
 */



var array = [Int]()

array.reserveCapacity(50)
for _ in 0..<50{
    array.append(Int.random(in: 0...1000))
}

print(array)

array.sort()

print(array)

var min = Int.max
var num1 = 0
var num2 = 0

for i in 0..<(array.count-1){
    
    let diff = array[i + 1] - array[i]
    if diff < min{
        min = diff
        num1 = array[i]
        num2 = array[i + 1]
    }
}

print("\(min) , \(num1) , \(num2)")




