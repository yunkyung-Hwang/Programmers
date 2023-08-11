import Foundation

// MST. 단, 다 연결할 필요 없이 S A B만 포함하면 끝
// 단순 정렬해서 MST 돌리면 필요 없는 길이 추가될 수 있음
// A 또는 B 부터 출발해서 A B S를 모두 방문하면 종료

// 완전탐색 A에서 출발해서 하나씩 탐색하면서 S와 B를 모두 방문하면 종료 (X)
// bfs, dfs는 원 웨이라서 안댐

// 플루이드

func solution(_ n:Int, _ s:Int, _ a:Int, _ b:Int, _ fares:[[Int]]) -> Int {
    let maxx = 987654321
    var f = [[Int]](repeating: [Int](repeating: maxx, count: n+1), count: n+1)
    for i in 1...n { f[i][i] = 0 }
    
    for fare in fares {
        let (n1, n2, fee) = (fare[0], fare[1], fare[2])
        f[n1][n2] = fee
        f[n2][n1] = fee
    }
    
    for k in 1...n {
        for i in 1...n {
            for j in 1...n {
                // if f[i][k] == Int.max || f[k][j] == Int.max { continue }
                f[i][j] = min(f[i][j], f[i][k] + f[j][k])
            }
        }
    }
    
    var result = Int.max
    for i in 1...n {
        // if f[i][s] == Int.max || f[i][a] == Int.max || f[i][b] == Int.max { continue }
        result = min(result, f[i][s] + f[i][a] + f[i][b])
    }
    
    return result
}
