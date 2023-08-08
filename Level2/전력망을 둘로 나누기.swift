import Foundation

// 문제
// 트리 구조의 송전탑
// 하나만 끊어서 네트워크를 두 개로 분할하되 두 그룹의 개수 차이 최소

// 40m

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    var w = [[Int]](repeating: [Int](), count: n + 1)
    for wire in wires {
        w[wire[0]].append(wire[1])
        w[wire[1]].append(wire[0])
    }
    
    func bfs(_ wire: [Int]) -> Int {
        var queue = [1]
        var qIdx = 0
        var visited = [Bool](repeating: false, count: n + 1)
        visited[1] = true
        
        while qIdx < queue.count {
            let t1 = queue[qIdx]
            qIdx += 1
            
            for t2 in w[t1] {
                if !visited[t2] && wire != [t1, t2] && wire != [t2, t1] {
                    queue.append(t2)
                    visited[t2] = true
                }
            }
        }
        
        return queue.count
    }
    
    var result = n
    for wire in wires {
        result = min(result, abs(n - bfs(wire) * 2))
    }
    
    return result
}


// import Foundation

// // wires <= 100
// // 하나씩 제거(방문처리) 후 bfs 돌리기

// func solution(_ n:Int, _ wires:[[Int]]) -> Int {
//     var result = Int.max
//     var g = [[Int]](repeating: [Int](), count: n+1)
    
//     for wire in wires {
//         g[wire[0]].append(wire[1])
//         g[wire[1]].append(wire[0])
//     }
    
//     for w in wires {
//         var visit = [Bool](repeating: false, count: n+1)
//         var cnt = 1
//         visit[w[0]] = true
//         visit[w[1]] = true
        
//         var q = [Int]()
//         q.append(w[0])
        
//         while !q.isEmpty {
//             let node = q.removeFirst()
            
//             for i in 0..<g[node].count {
//                 if visit[g[node][i]] { continue }
//                 visit[g[node][i]] = true
//                 q.append(g[node][i])
//                 cnt += 1
//             }
//         }
//         result = min(result, abs(n - cnt * 2))
//     }
    
//     return result
// }
