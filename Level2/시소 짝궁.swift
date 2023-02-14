import Foundation

// 풀이 1) 이분탐색
func solution(_ weights:[Int]) -> Int64 {
    var result = 0
    let w = weights.sorted()
    var ans = 0
    
    for i in 0..<w.count {
        if i > 0 && w[i] == w[i-1] {
            ans -= 1
            result += ans
            continue
        }
        
        func findIdx() -> Int { // 상한선 찾기
            var low = i
            var high = w.count - 1
            
            while low < high {
                let mid = low + (high - low) / 2
                if w[mid] > w[i] * 2 { return mid }
                else { low = mid+1 }
            }
            return low
        }
        
        ans = 0
        var j = findIdx()
        while j > i {
            if w[i] == w[j]
                || w[i] * 3 == w[j] * 2
                || w[i] * 4 == w[j] * 2
                || w[i] * 4 == w[j] * 3 {
                ans += 1
            }
            j-=1
        }
        
        result += ans
    }
    
    return Int64(result)
}
