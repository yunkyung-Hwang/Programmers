// Dynamic Programming(구글링)
import Foundation

func solution(_ land:[[Int]]) -> Int{
    var arr = land
    
    for i in 1..<land.count{
        arr[i][0] += max(arr[i-1][1], arr[i-1][2], arr[i-1][3])
        arr[i][1] += max(arr[i-1][0], arr[i-1][2], arr[i-1][3])
        arr[i][2] += max(arr[i-1][0], arr[i-1][1], arr[i-1][3])
        arr[i][3] += max(arr[i-1][0], arr[i-1][1], arr[i-1][2])
    }
  
    return max(arr[arr.count - 1][0], arr[arr.count - 1][1], arr[arr.count - 1][2], arr[arr.count - 1][3])
}

// 정확성 통과, 효율성 시간 초과
// func solution(_ land:[[Int]]) -> Int {
//     var answer = land[0]
    
//     for i in 1..<land.count {
//         let current = land[i]
//         let copyMaxs = answer
//         for j in 0..<4 {
//             if j != copyMaxs.firstIndex(of: copyMaxs.max()!)! {
//                 answer[j] = current[j] + copyMaxs.max()!
//             } else {
//                 answer[j] = current[j] + copyMaxs.sorted()[2]
//             }
//         }
//     }
//     return answer.max()!
// }
