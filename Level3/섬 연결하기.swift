import Foundation

// 문제
// 섬 100개 이하
// union

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    var result = 0
    var costs = costs.sorted(by: { $0[2] < $1[2]})
    var parent = Array(0...n)
    
    func findParent(_ e: Int) -> Int {
        if e != parent[e] {
            parent[e] = findParent(parent[e])
        }
        return parent[e]
    }
    
    func union(_ n1: Int, _ n2: Int) {
        let p1 = findParent(n1)
        let p2 = findParent(n2)
        if p1 < p2 {
            parent[p2] = p1
        } else {
            parent[p1] = p2
        }
    }
    
    for cost in costs {
        if findParent(cost[0]) != findParent(cost[1]) {
            union(cost[0], cost[1])
            result += cost[2]
        }
    }
    
    return result
}
