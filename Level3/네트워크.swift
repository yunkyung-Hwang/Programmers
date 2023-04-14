import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var visit = [Bool](repeating: false, count: n)
    var networks = [[Int]](repeating: [Int](), count: n)
    
  // 양방향 탐색임에 주의!!!!
  // j를 i+1부터 돌거면 양쪽으로 append해줘야하고
  // 0부터 돌거면 그냥 networks[i]에만 j를 append
    for i in 0..<n {
        for j in i+1..<n {
            if i != j && computers[i][j] == 1 {
                networks[i].append(j)
                networks[j].append(i)
            }
        }
    }
    
    var result = 0
    for i in 0..<n {
        if visit[i] { continue }
        result += 1
        
        var queue = [i]
        var qIdx = 0
        visit[i] = true

        while qIdx < queue.count {
            let node = queue[qIdx]
            qIdx += 1

            for network in networks[node] {
                if visit[network] { continue }
                visit[network] = true
                queue.append(network)
            }
        }
    }
    
    
    return result
}
