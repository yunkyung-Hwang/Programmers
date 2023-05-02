import Foundation

// 20분
// 문제 잘읽기!

typealias Point = (x: Int, y: Int)

func solution(_ numbers:[Int], _ hand:String) -> String {
    var result = ""
    var hands: (left: Point, right: Point) = ((3, 0), (3, 2))
    for num in numbers {
        let row = num == 0 ? 3 : (num - 1) / 3
        let col = num == 0 ? 1 : (num - 1) % 3
        
        if num == 1 || num == 4 || num == 7 {
            result += "L"
        } else if num == 3 || num == 6 || num == 9 {
            result += "R"
        } else {
            let leftD = getDistance(hands.left, (row, col))
            let rightD = getDistance(hands.right, (row, col))
            if leftD < rightD {
                result += "L"
            } else if leftD > rightD {
                result += "R"
            } else {
                result += (hand == "left") ? "L" : "R"
            }
        }
        
        if result.last! == "L" {
            hands.left = (row, col)
        } else if result.last! == "R" {
            hands.right = (row, col)
        }
    }
    
    
    return result
}

func getDistance(_ p1: Point, _ p2: Point) -> Int {
    return abs(p1.x - p2.x) + abs(p1.y - p2.y)
}
