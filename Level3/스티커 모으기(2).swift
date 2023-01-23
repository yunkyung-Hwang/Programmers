import Foundation

func solution(_ sticker:[Int]) -> Int{
    if sticker.count == 1 { return sticker[0] }
    
    var answer = 0
    var dp = [Int](repeating: 0, count: sticker.count + 2)
    
    for i in 3..<dp.count {
        dp[i] = max(dp[i-1], dp[i-2] + sticker[i-2])
    }
    
    answer = dp[dp.count - 1]
    
    for i in 2..<dp.count {
        dp[i] = max(dp[i-1], dp[i-2] + sticker[i-2])
    }

    return max(answer, dp[dp.count - 2])
}
