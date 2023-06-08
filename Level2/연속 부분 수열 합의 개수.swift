import Foundation

// 연속된 부분수열의 합의 종류
// 배열 한번더 이어붙여서 탐색
// 7 9 1 1 4 + 7 9 1 1 4

// 시간복잡도
// 1000 * 1000

// 10m

func solution(_ elements:[Int]) -> Int {
    let e = elements + elements
    var sum = Set<Int>()
    
    for i in 0..<elements.count {
        var s = 0
        for j in 0..<elements.count {
            s += e[i+j]
            sum.insert(s)
        }
    }
    
    return sum.count
}
