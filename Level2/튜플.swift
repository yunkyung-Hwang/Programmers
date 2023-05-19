import Foundation

// 원소가 중복되지 않는 튜플 s
// s.count <= 1000000(백만)
func solution(_ s:String) -> [Int] {
    let s = s.components(separatedBy: ["{", "}"]).map { String($0) }
    var sets = [Set<Int>]()
    
    for s in s {
        let ss = s.split(separator: ",").map { Int($0)! }
        if !ss.isEmpty { sets.append(Set(ss)) }
    }
    
    sets.append(Set())
    sets.sort(by: { $0.count < $1.count })
    var result = [Int]()
    for i in 1..<sets.count {
        result.append(sets[i].subtracting(sets[i-1]).first!)
    }

    return result
}
