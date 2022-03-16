// l*m, m*n
import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    let row = arr1.count
    let col = arr2[0].count
    var result = [[Int]](repeating: Array(repeating: 0, count: col), count: row)
    
    for l in 0..<arr1.count {
        for n in 0..<arr2[0].count {
            for m in 0..<arr2.count {
                result[l][n] += arr1[l][m] * arr2[m][n]
            }
        }
    }
    
    return result
}
