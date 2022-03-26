import Foundation

func solution(_ dirs:String) -> Int {
    var coordinate = Array(repeating: Array(repeating: Array(repeating: false, count: 4), count: 11), count: 11)
    var x = 5
    var y = 5
    var result = 0
    
    var arr = [Character]()

    for i in dirs {
        arr.append(i)
    }
    
    for i in 0..<dirs.count {
        switch arr[i] {
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
