func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    var b = [[String]](repeating: [String](repeating: "", count: n), count: m)
    let empty = "-"
    var result = 0
    for i in 0..<m {
        b[i] = board[i].map { String($0) }
    }

    // 2x2 사각형이 되는지 판단
    func isRect(_ x: Int, _ y: Int) -> Bool {
        if 0..<m ~= x && 0..<m ~= x + 1 && 0..<n ~= y && 0..<n ~= y + 1 {
            return b[x][y] == b[x+1][y] && b[x][y] == b[x][y+1] && b[x][y] == b[x+1][y+1]
        }
        return false
    }
    
    var flag = false
    while !flag {
        // 지워질 2x2 영역 체크
        var visit = [[Bool]](repeating: [Bool](repeating: false, count: n), count: m)
        flag = true
        for i in 0..<m {
            for j in 0..<n {
                if b[i][j] != empty && isRect(i, j) {
                    flag = false
                    visit[i][j] = true
                    visit[i][j+1] = true
                    visit[i+1][j] = true
                    visit[i+1][j+1] = true
                }
            }
        }
        
        // 지우고
        for i in 0..<m {
            for j in 0..<n {
                if visit[i][j] {
                    b[i][j] = empty
                    result += 1
                }
            }
        }
        
        // 내리기
        for i in Array(0..<m).reversed() {
            for j in 0..<n {
                if b[i][j] != empty {
                    var d = i
                    while (0..<m ~= d + 1) && (b[d + 1][j] == empty) {
                        d += 1
                    }
                    if d != i {
                        b[d][j] = b[i][j]
                        b[i][j] = empty
                    }
                }
            }
        }
    }
    
    return result
}
