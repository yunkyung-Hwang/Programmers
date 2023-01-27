import Foundation

// 0을 포함하지 않는 소수
// 0 기준으로 분리
// 211020101011
// -> 211 2 1 1 11

// String(number, radix: n진수)
// 소수 판별 메서드 √N

func solution(_ n:Int, _ k:Int) -> Int {
    let num = String(n, radix: k).split(separator: "0").map { Int(String($0))! }
    var result = 0
    for num in num {
        if isPrime(num) { result += 1 }
    }
    
    return result
}

func isPrime(_ num: Int) -> Bool {
    if num == 1 { return false }
    var i = 2
    while i * i <= num {
        if num % i == 0 { return false }
        i += 1
    }
    
    return true
}
