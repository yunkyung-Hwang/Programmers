import Foundation

// 문제
// sources 지역에 퍼져있는 각 부대원들이 roads를 따라 destionation으로 도착할 수 있는 각 최단거리

// 풀이
// 각 지역별 destination까지의 최단거리 저장

// 1 - 2 4 
// 2 - 1 4 5
// 3 -
// 4 - 1 2 5
// 5 - 2 4

// 1 2 3 4 5
// X 1 X 1 0 // dp[queue[qIdx]] + 1
// 2 1 X 1 0

// n: 총 지역 수, roads: 왕복 길, sources: 서로 다른 지역, destination: 도착 지점
func solution(_ n:Int, _ roads:[[Int]], _ sources:[Int], _ destination:Int) -> [Int] {
    /// road[i] = i지역과 연결된 지역 배열
    var road = [[Int]](repeating: [Int](), count: n+1)
    for r in roads {
        road[r[0]].append(r[1])
        road[r[1]].append(r[0])
    }
    var distance = [Int](repeating: -1, count: n+1)
    distance[destination] = 0
    var visited = [Bool](repeating: false, count: n+1)
    visited[destination] = true

    var queue = [destination]
    var qIdx = 0
    while qIdx < queue.count {
        let node = queue[qIdx]
        qIdx += 1

        for location in road[node] {
            if !visited[location] {
                visited[location] = true
                distance[location] = distance[node] + 1
                queue.append(location)
            }
        }
    }

    var result = [Int]()
    for source in sources {
        result.append(distance[source])
    }
    return result
}
