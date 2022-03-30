// 2차원 배열 인덱싱
// 0 1 2
// 3 4 5
// 6 7 8
// col 기준 하나씩 증가, row는 col이 한줄 돌면 증가
// left...right까지 해당 값을 result에 초기화

import Foundation

func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    let size = Int(right - left + 1)
    var row = Int(left) / n
    var col = Int(left) % n
    var result = [Int](repeating: 0, count: size)

    for i in 0..<size {
        result[i] = (row > col) ? row + 1 : col + 1
        col += 1
        if col >= n {
            col = 0
            row += 1
        }
    }
    
    return result
}
