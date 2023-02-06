import Foundation

print(solution(6, 6, [[2,2,5,4],[3,3,6,6],[5,1,6,3]]), "\n")
print(solution(3, 3, [[1,1,2,2],[1,2,2,3],[2,1,3,2],[2,2,3,3]]), "\n")
print(solution(100, 97, [[1,1,100,97]]), "\n")

func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    var result = [Int]()
    var graph = [[Int]](repeating: [Int](repeating: 0, count: columns + 1), count: rows + 1)
    var num = 1
    for i in 1...rows {
        for j in 1...columns {
            graph[i][j] = num
            num += 1
        }
    }
    
    for query in queries {
        let r1 = query[0], c1 = query[1], r2 = query[2], c2 = query[3]
        let tmp = graph[r1][c1]
        var mn = tmp
        
        // rotate
        for i in r1+1...r2 {
            graph[i-1][c1] = graph[i][c1]
            mn = min(mn, graph[i][c1])
        }
        
        for i in c1+1...c2 {
            graph[r2][i-1] = graph[r2][i]
            mn = min(mn, graph[r2][i])
        }
        
        for i in 0..<r2-r1 {
            graph[r2-i][c2] = graph[r2-i-1][c2]
            mn = min(mn, graph[r2-i-1][c2])
        }
        
        for i in 0..<c2-c1 {
            graph[r1][c2-i] = graph[r1][c2-i-1]
            mn = min(mn, graph[r1][c2-i-1])
        }
        graph[r1][c1+1] = tmp
        
        result.append(mn)
    }
    
    return result
}
