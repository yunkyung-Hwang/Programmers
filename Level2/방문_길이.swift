// 좌표 배열을 생성한다
// 각 좌표는 (왼, 오, 위, 아) 방향 bool 값을 갖는다
// 좌표로 들어오는 방향과 보내는 방향을 true로 체크한다
// 배열의 true 개수를 세고 들어오고 나가고 두번 체크되었으므로 반을 나눈다

import Foundation

func solution(_ dirs:String) -> Int {
    var coordinate = Array(repeating: Array(repeating: Array(repeating: false, count: 4), count: 11), count: 11)
    var x = 5
    var y = 5
    var result = 0
    
    dirs.forEach {
        switch $0 {
        case "L":
            if x > 0 {
                x -= 1
                coordinate[x+1][y][0] = true
                coordinate[x][y][1] = true
            }
        case "R":
            if x < 10 {
                x += 1
                coordinate[x-1][y][1] = true
                coordinate[x][y][0] = true
            }
        case "U":
            if y < 10 {
                y += 1
                coordinate[x][y-1][2] = true
                coordinate[x][y][3] = true
            }
        case "D":
            if y > 0 {
                y -= 1
                coordinate[x][y+1][3] = true
                coordinate[x][y][2] = true
            }
        default:
            break
        }
    }
    
    for i in 0..<11 {
        for j in 0..<11 {
            for k in 0..<4 {
                coordinate[i][j][k] ? result += 1 : nil
            }
        }
    }
    return result / 2
}
