func solution(_ targets:[[Int]]) -> Int {
    var result = 0
    var last = 0
    let t = targets.sorted(by: { $0[1] < $1[1] })
    
    for target in t {
        if target[0] >= last {
            result += 1
            last = target[1]
        }
    }
    return result
}

// 세헌 풀이
func solution2(_ targets: [[Int]]) -> Int {
    let targets = targets.sorted { $0[1] < $1[1] }
    
    var cnt = 0, idx = 0, temp:Double = -1
    
    while true {
        if idx > targets.count - 1 {
            break
        }
        if Double(targets[idx][0]) < temp && temp < Double(targets[idx][1]) {
            idx += 1
            continue
        }
        temp = Double(targets[idx][1]) - 0.5
        cnt += 1
        idx += 1
    }
    
    return cnt
}
