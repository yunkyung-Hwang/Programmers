// 이전 수를 저장하고 n까지 쭉 더하기
func solution(_ n:Int) -> Int {
    var f1 = 0
    var f2 = 1
    
    for _ in 2...n {
        let tmp = (f1 + f2) % 1234567
        f1 = f2
        f2 = tmp
    }
    
    return f2
}


// ver1 (실패)
func fibonacci(_ n: Int) -> Int {
    if n == 0 {
        return 0
    } else if n == 1 {
        return 1
    } else {
        return fibonacci(n - 1) + fibonacci(n - 2)
    }
}

func solution1(_ n:Int) -> Int {
    return fibonacci(n) % 1234567
}

// ver 2 (구글링) -> append 거슬림
func solution2(_ n:Int) -> Int {
    var fibonacci: [Int] = [0, 1]
    
    for i in 2...n {
        fibonacci.append((fibonacci[i-2] + fibonacci[i-1]) % 1234567)
    }
    
    return fibonacci[n]
}
