import Foundation

// 문제
// 던전 탐험
// 최소 필요 피로도 / 소모 피로도
// 던전을 최대한 많이 탐험하려함
// 탐험할 수 있는 최대 던전 수 구하기

// 풀이
// 던전의 개수 8개 이하 -> 완전탐색
// dfs를 던전 수만큼(하나씩 넣어서) 탐색

// dfs 종료 조건 및 초기화 시점 주의!!!!

// k: 현재 유저의 피로도
// dungeons: [[최소 필요 피로도, 소모 피로도]]
func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    var visited = [Bool](repeating: false, count: dungeons.count)
    var result = 0
        
    func dfs(_ k: Int, _ cnt: Int) {
        result = max(result, cnt)
        
        for i in 0..<dungeons.count {
            // 방문 안한 던전이고 필요 피로도를 만족하는 경우 -> dfs
            if !visited[i] && k >= dungeons[i][0] {
                visited[i] = true
                dfs(k - dungeons[i][1], cnt + 1)
                visited[i] = false
            }   
        }
    }
    
    for i in 0..<dungeons.count {
        if k >= dungeons[i][0] {
            visited[i] = true
            dfs(k - dungeons[i][1], 1)
            visited[i] = false
        }
    }
    
    return result
}
