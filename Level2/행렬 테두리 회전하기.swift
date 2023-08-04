import Foundation

// 직사각형으로 영역을 선택해 시계방향으로 회전
// 내부는 회전 안함
// 회전에 의해 바뀐 숫자 중 가장 작은 숫자들을 순서대로 return

// 복붙 하지말쟈

func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    let r = rows, c = columns
    var map = [[Int]](repeating: [Int](repeating: 0, count: c), count: r)
    for i in 0..<r*c {
        map[i / c][i % c] = i + 1
    }
    
    func rotate(_ query: [Int]) -> Int {
        let (x1, y1, x2, y2) = (query[0]-1, query[1]-1, query[2]-1, query[3]-1)
        var minNum = map[x1][y1]
        let tmp = map[x1][y1]
        
        // 왼쪽 변 2..<5
        for i in x1..<x2 {
            map[i][y1] = map[i+1][y1]
            minNum = min(minNum, map[i][y1])
        }
        
        // 아래 변 2..<4
        for i in y1..<y2 {
            map[x2][i] = map[x2][i+1]
            minNum = min(minNum, map[x2][i])
        }
        
        // 오른쪽 변 (2..<5).rev
        for i in (x1+1...x2).reversed() {
            map[i][y2] = map[i-1][y2]
            minNum = min(minNum, map[i][y2])
        }
        
        // 위쪽 변 (2..<4).rev
        for i in (y1+1...y2).reversed() {
            map[x1][i] = map[x1][i-1]
            minNum = min(minNum, map[x1][i])
        }
        
        map[x1][y1+1] = tmp
        
        return minNum
    }
    
    var result = [Int]()
    for query in queries {
        result.append(rotate(query))
    }
    
    return result
}

// import Foundation

// print(solution(6, 6, [[2,2,5,4],[3,3,6,6],[5,1,6,3]]), "\n")
// print(solution(3, 3, [[1,1,2,2],[1,2,2,3],[2,1,3,2],[2,2,3,3]]), "\n")
// print(solution(100, 97, [[1,1,100,97]]), "\n")

// func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
//     var result = [Int]()
//     var graph = [[Int]](repeating: [Int](repeating: 0, count: columns + 1), count: rows + 1)
//     var num = 1
//     for i in 1...rows {
//         for j in 1...columns {
//             graph[i][j] = num
//             num += 1
//         }
//     }
    
//     for query in queries {
//         let r1 = query[0], c1 = query[1], r2 = query[2], c2 = query[3]
//         let tmp = graph[r1][c1]
//         var mn = tmp
        
//         // rotate
//         for i in r1+1...r2 {
//             graph[i-1][c1] = graph[i][c1]
//             mn = min(mn, graph[i][c1])
//         }
        
//         for i in c1+1...c2 {
//             graph[r2][i-1] = graph[r2][i]
//             mn = min(mn, graph[r2][i])
//         }
        
//         for i in 0..<r2-r1 {
//             graph[r2-i][c2] = graph[r2-i-1][c2]
//             mn = min(mn, graph[r2-i-1][c2])
//         }
        
//         for i in 0..<c2-c1 {
//             graph[r1][c2-i] = graph[r1][c2-i-1]
//             mn = min(mn, graph[r1][c2-i-1])
//         }
//         graph[r1][c1+1] = tmp
        
//         result.append(mn)
//     }
    
//     return result
// }
