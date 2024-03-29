import Foundation

// 문제
// 순서 안바꾸고 모두 사용
// +/-

// 2^20 = 1048576

// 10m

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var result = 0
    func dfs(_ idx: Int, _ sum: Int) {
        if idx >= numbers.count - 1 {
            if sum == target { result += 1 }
            return
        }
    
        dfs(idx + 1, sum + numbers[idx + 1])
        dfs(idx + 1, sum - numbers[idx + 1])
    }
    
    dfs(-1, 0)
    
    return result
}

// import Foundation

// // 문제
// // 방법의 수를 반환

// // 풀이
// // 완전 탐색
// // numbers <= 20
// // 시간복잡도 2^20 = 1048576 백만

// // 5분

// func solution(_ numbers:[Int], _ target:Int) -> Int {
//     var result = 0

//     func dfs(idx: Int, sum: Int) {
//         if idx == numbers.count {
//             if sum == target {
//                 result += 1
//             }
//             return
//         }
        
//         dfs(idx: idx + 1, sum: sum + numbers[idx])
//         dfs(idx: idx + 1, sum: sum - numbers[idx])
//     }
    
//     dfs(idx: 0, sum: 0)
    
//     return result
// }
