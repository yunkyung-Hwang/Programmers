import Foundation

func solution(_ line:[[Int]]) -> [String] {
    var cross = [[Int]]()
    var maxX = Int.min
    var minX = Int.max
    var maxY = Int.min
    var minY = Int.max
    for i in 0..<line.count {
        for j in i+1..<line.count {
            let bfed = (line[i][1] * line[j][2] - line[i][2] * line[j][1])
            let adbc = (line[i][0] * line[j][1] - line[i][1] * line[j][0])
            let ecaf = (line[i][2] * line[j][0] - line[i][0] * line[j][2])
            if adbc == 0 { continue }
            let x = bfed / adbc
            let y = ecaf / adbc

            if bfed % adbc == 0 && ecaf % adbc == 0 && !cross.contains([x, y]){
                cross.append([x, y])
                maxX = max(x, maxX)
                minX = min(x, minX)
                maxY = max(y, maxY)
                minY = min(y, minY)
            }
        }
    }
    
    var stars = [[String]](repeating: [String](repeating: ".", count: maxX - minX + 1), count: maxY - minY + 1)
    var result = [String](repeating: "", count: maxY - minY + 1)
    
    for i in 0..<cross.count {
        stars[cross[i][1] - minY][cross[i][0] - minX] = "*"
    }
    
    for i in 0..<result.count {
        result[i] = stars[i].reduce("", +)
    }
    
    return result.reversed()
}
