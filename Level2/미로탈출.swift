import Foundation

// 문제
// 직사각형 격자 미로 탈출
// 통로로만 지나갈 수 있음
// 통로중 하나에 레버가 있고 레버를 당긴 후 출구로 나가야 탈출할 수 있다.
// 출구가 있는 칸도 지나갈 수는 있음

func solution(_ maps:[String]) -> Int {
    let n = maps.count, m = maps[0].count
    typealias Point = (x: Int, y: Int, distance: Int)
    var now: Point = (0, 0, 0)
    var lever: Point = (0, 0, 0)
    var exit: Point = (0, 0, 0)
    var mapArr = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    for i in 0..<n {
        for p in maps[i].enumerated() {
            if p.element == "S" { now = (i, p.offset, 0) }
            else if p.element == "L" { lever = (i, p.offset, 0) }
            else if p.element == "E" { exit = (i, p.offset, 0) }
            mapArr[i][p.offset] = p.element != "X"
        }
    }
    
    func bfs(_ start: Point, _ destination: Point) -> Int {
        let dx = [0, 0, -1, 1]
        let dy = [-1, 1, 0, 0]
        var queue = [start]
        var qIdx = 0
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
        
        while qIdx < queue.count {
            let node = queue[qIdx]
            qIdx += 1
            
            for i in 0..<4 {
                let px = node.x + dx[i]
                let py = node.y + dy[i]
                if 0..<n ~= px && 0..<m ~= py && mapArr[px][py] && !visited[px][py] {
                    if px == destination.x && py == destination.y {
                        return node.distance + 1
                    }
                    visited[px][py] = true
                    queue.append((px, py, node.distance + 1))
                }
            }
        }
        // destination에 도달하지 못함
        return Int.max
    }
    
    let toLever = bfs(now, lever)
    let toExit = bfs(lever, exit)
    
    return (toLever == Int.max || toExit == Int.max) ? -1 : (toLever + toExit)
}
