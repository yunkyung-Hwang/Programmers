import Foundation

// 문제
// 켜고 끄고 dfs

func solution(_ n:Int, _ lighthouse:[[Int]]) -> Int {
    var light = [[Int]](repeating: [Int](), count: n + 1)
    var visited = [Bool](repeating: false, count: n + 1)

    for l in lighthouse {
        light[l[0]].append(l[1])
        light[l[1]].append(l[0])
    }
    
    // 해당 등대가 꺼졌을때, 켜졌을때 총 켜진 등대 개수
    typealias Light = (on: Int, off: Int)
    
    func dfs(_ idx: Int) -> Light {
        visited[idx] = true
        if light[idx].isEmpty {
            return (1, 0)
        }
        
        var on = 1, off = 0
        for v in light[idx].filter({ !visited[$0] }) {
            let (child_on, child_off) = dfs(v)
            on += min(child_on, child_off)
            off += child_on
        }
        
        return (on, off)
    }
    
    let (on, off) = dfs(1)
    return min(on, off)
}
