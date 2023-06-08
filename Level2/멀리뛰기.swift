// 문제
// 1칸 또는 2칸을 뛸 수 있음
// 딱 맞게 도착해야함 넘치면 안돼

// 풀이
// 1234567로 나눠라하는거 보니 dp네
// 가장 마지막칸부터
//  0    1    2    3    4
//  _    _    _    _    _
// 3+2  2+1  1+1  1+0  '1'
// 다음칸 + 다다음칸

func solution(_ n:Int) -> Int {
    var dp = [Int](repeating: 0, count: n+1)
    dp[n] = 1
    
    for i in Array(0..<n).reversed() {
        if i+2 <= n { dp[i] = (dp[i+1] + dp[i+2]) % 1234567 }
        else { dp[i] = dp[i+1] % 1234567 }
    }
    
    return dp[0]
}
