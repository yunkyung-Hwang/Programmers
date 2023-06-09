import Foundation

// 문제
// 미리 입력된 명령에 따라 진행
// E동 W서 S남 N북
// 1. 벗어나는지 판단
// 2. 장애물을 만나는지 판단
// 둘중 하나라도 해당되면 무시

// 40m

// 구현 제발 꼼꼼하게 하자

func solution(_ park:[String], _ routes:[String]) -> [Int] {
    let n = park.count, m = park[0].count
    var p = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    typealias L = (x: Int, y: Int)
    var dog: L = (0, 0)
    
    for i in 0..<n {
        p[i] = park[i].map { $0 != "X" }
        for j in 0..<m {
            let arr = Array(park[i])
            if arr[j] == "S" { dog = (i, j) }
        }
    }
    
    let dx = [0, 0, 1, -1]
    let dy = [1, -1, 0, 0]

    for route in routes {
        let r = route.split(separator: " ").map { String($0) }
        let move = Int(r[1])!
        let dir: Int
        switch r[0] {
        case "E":
            dir = 0
        case "W":
            dir = 1
        case "S":
            dir = 2
        case "N":
            dir = 3
        default:
            dir = -1
        }
        
        if (0..<n ~= (dog.x + dx[dir] * move)) && (0..<m ~= (dog.y + dy[dir] * move)) {
            var t = dog
            var flag = true
            for _ in 0..<move {
                t.x += dx[dir]
                t.y += dy[dir]
                
                flag = p[t.x][t.y]
                if !flag { break }
            }
            if flag { dog = t }
        }
    }
    return [dog.x, dog.y]
}
