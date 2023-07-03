import Foundation

/**
 *  https://developer.apple.com/documentation/swift/array
 *
 *
 *  Value Type 값 👉🏻 Stack에 메모리 할당
 *  Reference Type 값 👉🏻 Heap에 메모리 할당
 *
 *  하지만!!!
 *  Value Type 값 👉🏻 Heap에 메모리 할당하는 경우
 *  Array, Dictionary, Set, String(collection of characters)과 같은 가변 길이 Collection들은 일반적으로 내부 데이터를 Heap 에 저장
 *
 *  Reference Type 값 👉🏻 Stack에 메모리 할당
 *  Reference Type의 사이즈가 고정되어있거나, 라이프타임을 예측할 수 있을 때 스위프트 컴파일러는 Reference type을 Stack에 할당할 수도 있다고 합니다.
 *  이러한 최적화는 SIL 생성 구간에서 발생
 *  https://medium.com/@jungkim/%EC%8A%A4%EC%9C%84%ED%94%84%ED%8A%B8-%ED%83%80%EC%9E%85%EB%B3%84-%EB%A9%94%EB%AA%A8%EB%A6%AC-%EB%B6%84%EC%84%9D-%EC%8B%A4%ED%97%98-4d89e1436fee
 *   https://sujinnaljin.medium.com/ios-swift%EC%9D%98-type%EA%B3%BC-%EB%A9%94%EB%AA%A8%EB%A6%AC-%EC%A0%80%EC%9E%A5-%EA%B3%B5%EA%B0%84-25555c69ccff
 *
 */


//Swift에서의 Array는 capacity가 부족한 경우 2배씩 늘어난다.
 


//Growing the Size of an Array
print("------ReserveCapacity------")
var reserveArray = [String]()
reserveArray.reserveCapacity(5) // 기본 capacity 설정
print(reserveArray.count, reserveArray.capacity)


//Modifying Copies of Arrays
//Copy on write
//데이터 복사시 실제로 값을 복사되지 않고, 동일한 값을 참조하다가 데이터 변경이 발생될 시에 복사해 값을 변경
//

// An integer type with reference semantics
class IntegerReference {
    var value = 10
}
var firstIntegers = [IntegerReference(), IntegerReference()]
var secondIntegers = firstIntegers

print("------Copy on write------")
// Modifications to an instance are visible from either array
firstIntegers[0].value = 100
print(secondIntegers[0].value)
// Prints "100"


// Replacements, additions, and removals are still visible
// only in the modified array
firstIntegers[0] = IntegerReference()
print(firstIntegers[0].value)
// Prints "10"
print(secondIntegers[0].value)
// Prints "100"




/**
 *  배열의 시간 복잡도.
 *
 *  검색 O(n), 삽입 O(n), 삭제 O(n) . 밀리는걸 생각!!!
 */



class CustomArray{
    var array : [Int]
    var length : Int
    let maxLength : Int
    
    init(){
        
        self.length = -1
        self.maxLength = 5
        self.array = Array(repeating: -1, count: maxLength)
    }
    
    func search(_ value : Int) -> Int{
        print("search")
        for i in self.array.enumerated(){
            if i.element == value{
                return i.offset
            }
        }
        
        return -1
    }
    
    func insert( value : Int , index : Int){
        if  index < 0 || index > length + 1 || index == maxLength{
            print("insert Fail")
            return
        }
                                
        var i = length
        while i > index{
            if i + 1 < maxLength{
                array[i + 1] = array[i]
            }
            i -= 1
        }
        
        array[index] = value
        if length + 1 < maxLength{
            length += 1
        }
        
        print(array)
    }
    
    func delete(_ index : Int){
        if index < 0 || index > length{
            print("delete Fail")
            return
        }
                
        var i = index + 1
        while i <= length{
            array[i-1] = array[i]
            i += 1
        }
        
        array[length] = -1
        length -= 1
        print(array)
    }
    
    
}

print("------Customer Array------")
let customerArray = CustomArray()
print(customerArray.array)

//for i in 0..<3{
//    customerArray.insert(value: i, index: i)
//}
//customerArray.insert(value: 99, index: 4)


for i in 0..<customerArray.maxLength{
    customerArray.insert(value: i, index: i)
}
customerArray.insert(value: 99, index: 3)

print("---------delete----------")
customerArray.delete(2)
customerArray.delete(2)
customerArray.delete(2)
customerArray.delete(2)
