import Foundation

func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    var answer = 1
    let inf = Int(1e9)
    var graph = [[Int]](repeating: [Int](repeating: inf, count: N + 1), count: N + 1)
    
    for road in road {
        graph[road[0]][road[1]] = min(graph[road[0]][road[1]], road[2])
        graph[road[1]][road[0]] = min(graph[road[1]][road[0]], road[2])
    }
    
    for t in 1...N {
        for i in 1...N {
            for j in 1...N {
                if i == j { continue }
                graph[i][j] = min(graph[i][j], graph[i][t] + graph[j][t])
            }
        }
    }
    
    for i in 1...N {
        if graph[1][i] <= k { answer += 1 }
    }
    
    return answer
}
