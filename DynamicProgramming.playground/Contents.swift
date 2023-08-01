import Foundation





func fibonacciRecursive( number : Int , cache : inout [Int?]) -> Int{
    if number <= 1{
        return number
    }
        
    if cache[number] != nil{
        return cache[number]!
    }
    
    let ret = fibonacciRecursive(number: number - 1, cache: &cache) + fibonacciRecursive(number: number - 2, cache: &cache)
    
    cache[number] = ret
        
    return ret
}

func fibonacchi(number : Int) -> Int{
    var cache = Array<Int?>(repeating: nil, count: number  + 1)
    cache[0] = 0
    cache[1] = 1
    
    
    for i in 2...number{
        cache[i] = cache[i - 1]! + cache[i - 2]!
    }
    
    return cache[number]!
}


fibonacchi(number: 10)




struct Item{
    let value : Int
    let space : Int
}


func getmaxValue( numSpace : Int , items : [Item]) -> Int{

    //array[items.count][numspace + 1]
    var cache = Array.init(
        repeating: Array<Int>(repeating: 0, count: numSpace + 1),
        count: items.count
    )
    
    
    //first column
    for s in 1...numSpace{
        if items[0].space > s{ continue }
        cache[0][s] = items[0].value
    }
    
    //remain column
    for i in 1..<items.count{
        for s in 1...numSpace{

            if items[i].space > s{
                cache[i][s] = cache[i - 1][s]
                continue
            }
            
            
            let remainspace = s - items[i].space
            let remainMax = cache[i - 1][remainspace]
                        
            
            let choice1 = cache[i - 1][s]   //up column
            let choice2 = items[i].value + remainMax // current item + remainvalue

            cache[i][s] = max(choice1, choice2)
        }
    }
    
    return cache[items.count - 1][numSpace]
}


let items = [
    Item(value: 3, space: 5),
    Item(value: 9, space: 12),
    Item(value: 1, space: 2),
    Item(value: 5, space: 4),
    Item(value: 7, space: 9)
]

let maxValue = getmaxValue(numSpace: 15, items: items)
print(maxValue)
