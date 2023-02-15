import Foundation

// wires <= 100
// 하나씩 제거(방문처리) 후 bfs 돌리기

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    var result = Int.max
    var g = [[Int]](repeating: [Int](), count: n+1)
    
    for wire in wires {
        g[wire[0]].append(wire[1])
        g[wire[1]].append(wire[0])
    }
    
    for w in wires {
        var visit = [Bool](repeating: false, count: n+1)
        var cnt = 1
        visit[w[0]] = true
        visit[w[1]] = true
        
        var q = [Int]()
        q.append(w[0])
        
        while !q.isEmpty {
            let node = q.removeFirst()
            
            for i in 0..<g[node].count {
                if visit[g[node][i]] { continue }
                visit[g[node][i]] = true
                q.append(g[node][i])
                cnt += 1
            }
        }
        result = min(result, abs(n - cnt * 2))
    }
    
    return result
}
