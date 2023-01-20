import Foundation

func solution2(_ a:[Int], _ b:[Int]) -> Int {
    let a = a.sorted(by: >)
    let b = b.sorted(by: >)
    var result = 0
  
    var idxA = 0, idxB = 0
    while idxA < a.count {
        if a[idxA] < b[idxB] {
            result += 1
            idxB += 1
        }
        idxA += 1
    }
    
    return result
}

// 풀이 1) 효율성 시간초과
func solution1(_ a:[Int], _ b:[Int]) -> Int {
    let a = a.sorted(by: >)
    let b = b.sorted(by: >)
    var result = 0
  
    var idxA = 0, idxB = 0
    while idxA < a.count {
        if a[idxA] < b[idxB] {
            result += 1
            idxA += 1
            idxB += 1
        } else {
            idxA += 1
        }
    }
    
    return result
}
