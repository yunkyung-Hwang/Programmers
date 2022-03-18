import Foundation

func solution(_ A:[Int], _ B:[Int]) -> Int
{
    var ans = 0

    let sortedA = A.sorted()
    // B.sorted(by: >)하고 i번째끼리 곱하면 시간초과
    let sortedB = B.sorted()
    
    for i in 0..<sortedA.count {
        ans += sortedA[i] * sortedB[sortedA.count - 1 - i]
    }

    return ans
}
