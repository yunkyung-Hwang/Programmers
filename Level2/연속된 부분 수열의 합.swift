import Foundation

// 문제
// 오름차순
// 연속하는 부분수열
// 부분 수열의 합은 k
// 여러개일 경우 길이가 짧은 수열
// 길이가 짧은게 여러개일 경우 제일 앞쪽

// 풀이
// 투포인터 한바퀴 싹

func solution(_ sequence:[Int], _ k:Int) -> [Int] {
    var sum = sequence[0]
    var s = 0, e = 0
    var size = Int.max
    var result = [0, 0]
    
    while s < sequence.count && e < sequence.count {
        if sum < k {
            e += 1
            if e == sequence.count { break }
            sum += sequence[e]
        } else if sum > k {
            sum -= sequence[s]
            s += 1
        } else {
            if size > e - s {
                result = [s, e]
                size = e - s
            }
            e += 1
            if e == sequence.count { break }
            sum += sequence[e]
        }
    }
    
    return result
}
