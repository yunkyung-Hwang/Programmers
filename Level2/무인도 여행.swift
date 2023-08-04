import Foundation

// 문제
// 1~9사이의 자연수가 적혀있는 직사각형 격자
// 인접한 칸끼리 무인도를 이룸
// 각 섬에서 머무를 수 있는 기간을 오름차순으로 반환

// 15m

func solution(_ maps:[String]) -> [Int] {
    let n = maps.count
    let m = maps[0].count
    var map = [[String]](repeating: [String](repeating: "X", count: m), count: n)
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    for i in 0..<maps.count {
        map[i] = maps[i].map { String($0) }
        visited[i] = maps[i].map { $0 == "X" }
    }
    typealias Point = (x: Int, y: Int)
    let dx = [0, 0, -1, 1]
    let dy = [-1, 1, 0, 0]
    
    func bfs(_ start: Point) -> Int {
        var days = Int(map[start.x][start.y])!
        var queue: [Point] = [start]
        var qIdx = 0
        visited[start.x][start.y] = true
        
        while qIdx < queue.count {
            let node = queue[qIdx]
            qIdx += 1
            
            for i in 0..<4 {
                let px = node.x + dx[i]
                let py = node.y + dy[i]
                
                if 0..<n ~= px && 0..<m ~= py && !visited[px][py] {
                    visited[px][py] = true
                    days += Int(map[px][py])!
                    queue.append((px, py))
                }
            }
        }
        return days
    }
    
    var result = [Int]()
    for i in 0..<n {
        for j in 0..<m {
            if !visited[i][j] { 
                let days = bfs((i, j))
                if days != 0 {
                    result.append(days)    
                }
            }
        }
    }
    
    return result.count == 0 ? [-1] : result.sorted()
}
