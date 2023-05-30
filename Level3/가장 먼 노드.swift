import Foundation

// 1번 노드에서 가장 멀리 떨어진 노드의 개수
// 최단경로로 이동했을 때 간선의 개수가 가장 많은

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    var result = 0
    var g = [[Int]](repeating: [Int](), count: n+1)
    for e in edge {
        g[e[0]].append(e[1])
        g[e[1]].append(e[0])
    }
    
    var queue = [1]
    var distance = [Int](repeating: -1, count: n+1)
    distance[1] = 0
    
    while !queue.isEmpty {
        let node = queue.removeFirst()
        
        for i in g[node] {
            if distance[i] == -1 {
                queue.append(i)
                distance[i] = distance[node] + 1
            }
        }
    }
    
    let maxx = distance.max()
    for d in distance {
        if d == maxx {
            result += 1
        }
    }
    
    return result
}
