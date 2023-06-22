import Foundation

// 이동할 수 없을때까지 이동
// 목표지점(G)에 도달할떄까지 이동

// 풀이) BFS
func solution(_ board:[String]) -> Int {
    let n = board.count, m = board[0].count
    var b = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    typealias Point = (x: Int, y: Int, moveCount: Int)
    var now: Point = (0, 0, 0)
    var destination: Point = (0, 0, 0)
    for i in 0..<n {
        for bb in board[i].enumerated() {
            if bb.element == "R" { now = (i, bb.offset, 0) }
            else if bb.element == "G" { destination = (i, bb.offset, 0) }
            b[i][bb.offset] = bb.element != "D"
        }
    }
    
    let dx = [0, 0, -1, 1]
    let dy = [-1, 1, 0, 0]
    
    func move(_ from: Point, _ dir: Int) -> Point {
        var px = from.x
        var py = from.y
        while 0..<n ~= px + dx[dir] && 0..<m ~= py + dy[dir] && b[px+dx[dir]][py+dy[dir]] {
            px += dx[dir]
            py += dy[dir]
        }
        
        return (px, py, 0)
    }
    
    func bfs() -> Int {
        var result = 0
        var queue = [now]
        var qIdx = 0
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n) 
        visited[now.x][now.y] = true
        while qIdx < queue.count {
            let node = queue[qIdx]
            qIdx += 1
            
            for i in 0..<4 {
                let p = move(node, i)
                if !visited[p.x][p.y] {
                    if p.x == destination.x && p.y == destination.y {
                        return node.moveCount + 1
                    }
                    visited[p.x][p.y] = true
                    queue.append((p.x, p.y, node.moveCount + 1))
                }
            }
        }
        return Int.max
    }
    
    let result = bfs()
    return (result == Int.max) ? -1 : result
}

// 풀이 1) dfs 시간초과
// 일반적으로 최단거리에서 dfs 탐색하면 최선의 상황이 아니라면 불필요한 부분 다 탐색해서 시간초과
// import Foundation

// func solution(_ board:[String]) -> Int {
//     let n = board.count, m = board[0].count
//     var b = [[String]](repeating: [String](repeating: ".", count: m), count: n)
//     var now: (x: Int, y: Int) = (0, 0)
//     for i in 0..<n {
//         b[i] = board[i].map { String($0) }
//         for j in 0..<m {
//             if b[i][j] == "R" { now = (i, j) }
//         }
//     }
//     let dx = [0, 0, -1, 1]
//     let dy = [-1, 1, 0, 0]
    
//     var result = Int.max
//     var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
//     func dfs(_ p: (x: Int, y: Int), _ cnt: Int) {
//         if b[p.x][p.y] == "G" {
//             result = min(result, cnt)
//             return
//         }
        
//         for i in 0..<4 {
//             var px = p.x, py = p.y
//             while 0..<n ~= px + dx[i] && 0..<m ~= py + dy[i]
//                 && b[px + dx[i]][py + dy[i]] != "D" {
//                 px += dx[i]
//                 py += dy[i]
//             }
            
//             if !visited[px][py] {
//                 visited[px][py] = true
//                 dfs((px, py), cnt + 1)
//                 visited[px][py] = false
//             }
//         }
//     }
//     dfs(now, 0)
    
//     return result == Int.max ? -1 : result
// }
