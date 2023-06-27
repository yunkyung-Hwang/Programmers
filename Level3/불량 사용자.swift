import Foundation

// 불량 사용자

// 문제
// 일부가 *로 가려져있는 제재 목록과 회원 목록이 있을때
// 가능한 경우의 수 구하기

// 풀이
// 주의
// 한 아이디가 여러 제재 목록에 해당될 수 있음
// 단, 제재 목록 순서에 관계없이 목록 집합이 같으면 같은것
// 제재 아이디 기준 해당할 수 있는 닉네임 2차원 배열 만들고 dfs
// 목록이 겹칠 수 있으므로 Set으로 관리

// 35m

// O(8)
func isBannedID(_ nick1: String, _ nick2: String) -> Bool {
    if nick1.count != nick2.count { return false }
    
    let nick1 = Array(nick1)
    let nick2 = Array(nick2)
    for i in 0..<nick1.count {
        if nick1[i] != "*" && nick2[i] != "*" && nick1[i] != nick2[i] { return false }
    }
    return true
}

func solution(_ user_id:[String], _ banned_id:[String]) -> Int {
    var bannedID = [[String]](repeating: [String](), count: banned_id.count)
    var visited = [String: Bool]()
    for user in user_id {
        visited[user] = false
        for i in 0..<banned_id.count {
            if isBannedID(banned_id[i], user) {
                bannedID[i].append(user)
            }
        }
    }
    
    var result = Set<Set<String>>()
    func dfs(_ idx: Int, _ ids: [String]) {
        if idx == banned_id.count {
            result.insert(Set(ids))
            return
        }
        
        for user in bannedID[idx] {
            if visited[user] ?? true { continue }
            visited[user] = true
            dfs(idx + 1, ids + [user])
            visited[user] = false
        }
    }
    
    dfs(0, [])
    
    return result.count
}
