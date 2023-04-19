import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var result = [Int: Double]()
    var cnt = [Int](repeating: 0, count: N+2)
    var total = stages.count
    
    for stage in stages {
        cnt[stage] += 1
    }
    
    for i in 1...N {
        if cnt[i] != 0 {
            result[i] = Double(cnt[i]) / Double(total)
            total -= cnt[i]
        } else { 
            result[i] = 0
        }
    }
    
    return result.sorted(by: <).sorted(by: { $0.1 > $1.1 }).map { $0.key }
}
