import Foundation

// 풀이 1)  33m
func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    var queue = [0] + queue1 + queue2
    for i in 1..<queue.count {
        queue[i] += queue[i-1]
    }
    
    var sum = queue.last!
    if sum % 2 != 0 { return -1 }
    else { sum /= 2 }
    
    var p1 = 0, p2 = queue1.count
    var result = 0
    var flag = false
    
    while p2 < queue.count && p1 < queue.count {
        if queue[p2] - queue[p1] > sum {
            p1 += 1
        } else if queue[p2] - queue[p1] < sum {
            p2 += 1
        } else {
            flag = true
            break
        }
        result += 1
    }
    
    return flag ? result : -1
}
