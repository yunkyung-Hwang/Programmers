import Foundation

func solution(_ answers:[Int]) -> [Int] {
    var p = [Int: Int]()
    let s1 = [1, 2, 3, 4, 5]
    let s2 = [2, 1, 2, 3, 2, 4, 2, 5]
    let s3 = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    for i in 0..<answers.count {
        if s1[i%s1.count] == answers[i] {
            p[1] = (p[1] ?? 0) + 1
        }
        if s2[i%s2.count] == answers[i] {
            p[2] = (p[2] ?? 0) + 1
        }
        if s3[i%s3.count] == answers[i] {
            p[3] = (p[3] ?? 0) + 1
        }
    }
    
    let maxx = p.values.max()!
    return p.filter{ $0.value == maxx }.keys.sorted()
}
