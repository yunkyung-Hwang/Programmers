// 재귀
// 배열이 0 또는 1 하나로만 이뤄져있으면 result의 해당 수를 +1
// 그렇지 않으면 4분할시켜 다시 진행
// 하나씩 쪼개질때까지

import Foundation
var result = [0, 0]

func solution(_ arr:[[Int]]) -> [Int] {
    quadTree(arr)
    
    return result
}

func quadTree(_ arr:[[Int]]) {
    var isOpposite = false
    for i in 0..<arr.count {
        for j in 0..<arr.count {
            if arr[0][0] != arr[i][j] {
                isOpposite = true
                break
            }
        }
    }
    
    if !isOpposite {
        result[arr[0][0]] += 1
    } else {
        let half = arr.count / 2
        var tmp = [[Int]](repeating: [Int](repeating: 0, count: half), count: half)
        
        for i in 0..<half {
            for j in 0..<half{
                tmp[i][j] = arr[i][j]
            }
        }
        quadTree(tmp)
        
        for i in half..<arr.count {
            for j in 0..<half{
                tmp[i - half][j] = arr[i][j]
            }
        }
        quadTree(tmp)
        
        for i in 0..<half {
            for j in half..<arr.count{
                tmp[i][j - half] = arr[i][j]
            }
        }
        quadTree(tmp)
        
        for i in half..<arr.count {
            for j in half..<arr.count {
                tmp[i - half][j - half] = arr[i][j]
            }
        }
        quadTree(tmp)
    }
}
