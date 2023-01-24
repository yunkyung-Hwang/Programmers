import Foundation

print(solution([1,1,2,3]))

// 시작, 끝, 중간점이 모두 움직임
// 이분탐색으로 하려했으나 기준도 애매 중간점 잡기도 애매
// 차라리 완전 탐색

// 중간값 기준 0 ~ cookie.count일 때
// 시작점 끝점이 한칸씩 이동
// 중간에 같은값 나와도 최대값이 또 존재할 수 있으니 그냥 끝까지 이동

func solution(_ cookie:[Int]) -> Int {
    var result = 0
    var m = 0
    var sum = [0] + cookie
    
    // 매번 합을 구하지 않기 위해 sum dp 구현
    // reduce 쓰면 O(N^3)됨
    for i in 1..<sum.count {
        sum[i] += sum[i-1]
    }
    
    while m < sum.count {
        var l = m, r = m
        while l > 0 && r < sum.count {
            if sum[m] - sum[l-1] > sum[r] - sum[m] {
                r += 1
            } else if sum[m] - sum[l-1] < sum[r] - sum[m] {
                l -= 1
            } else {
                result = max(result, sum[r] - sum[m])
                r += 1
                l -= 1
            }
        }
        
        m += 1
    }
    
    return result
}
