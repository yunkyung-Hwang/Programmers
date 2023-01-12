import Foundation

func solution(_ n:Int, _ m:Int, _ x:Int, _ y:Int, _ r:Int, _ c:Int, _ k:Int) -> String {
    var result = ""
    // 하 좌 우 상
    let dx = [1, 0, 0, -1]
    let dy = [0, -1, 1, 0]
    let dir = ["d", "l", "r", "u"]
    var essential = [String]()
    var extraCnt = k - (abs(x-r) + abs(y-c))
    var now = [x, y]
    
    if (extraCnt % 2 != 0) || extraCnt < 0 { return "impossible" }
    
    for _ in 0..<abs(x-r) {
        essential.append(x-r > 0 ? "u" : "d")
    }

    for _ in 0..<abs(y-c) {
        essential.append(y-c > 0 ? "l" : "r")
    }
    
    while extraCnt > 0 {
        for i in 0..<4 {
            // 이동할 수 있으면
            if now[0] + dx[i] > 0 && now[0] + dx[i] <= n
                && now[1] + dy[i] > 0 && now[1] + dy[i] <= m {
                // 추가
                result += dir[i]
                
                // 이동
                now[0] += dx[i]
                now[1] += dy[i]
                
                // 처리
                if essential.contains(dir[i]) {
                    essential.remove(at: essential.firstIndex(of: dir[i])!)
                } else {
                    if extraCnt > 0 {
                        // 반대 추가
                        essential.append(dir[3-i])
                        extraCnt -= 2
                    }
                }
                break
            }
        }
    }
    
    result += essential.sorted().joined()
    
    return result
}
