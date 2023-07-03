import Foundation



func fabonachi(_ n : Int) -> Int{
    if n <= 1{
        return n
    }
        
    return  fabonachi(n - 1 ) + fabonachi(n - 2 )
}

//1 1 2 3 5
fabonachi(5)



func factorial(_ n : Int) -> Int{
    if n <= 1{
        return 1
    }
    
    return n * factorial(n - 1)
}

func factorialTailCall( n : Int , fac : Int) -> Int{
    if n <= 1{
        return fac
    }
    
    return factorialTailCall(n: n - 1 , fac:  n * fac )
}


func factorialRepeat(n : Int) -> Int{
    var fac = 1
    
    var i = n
    
    while i > 1{
        fac *= i
        i -= 1
    }
    
    return fac
}


//5 4 3 2 1
factorial(5)
factorialTailCall(n: 5, fac: 1)
factorialRepeat(n: 5)


/**
 *  s t g
 *  s에 있는 n개의 원판을 t를 사용해여  g로 이동해야한다.
 *  원판을 한번에 한개씩 이동해야하고 각 폴대에서 원판은 항상 큰것부터 작은것 순서로 위치해야한다.
 */

//s : 출발 , g : 도착 , t : 임시
func hanoi( n : Int, s : Character , g : Character , t : Character){
    
    if n > 0{
        //n-1개를 s에서 t로 옮김
        hanoi(n: n - 1, s: s, g: t, t: g)
        print("\(n)번 원판 이동  \(s) -> \(g)")
        //n-1개를 t에서 g로 옮김
        hanoi(n: n - 1, s: t, g: g, t: s)
    }
    
    return
}


hanoi(n: 3, s: "s", g: "g", t: "t")
