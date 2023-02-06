import Foundation

print(solution(["john", "mary", "edward", "sam", "emily", "jaimie", "tod", "young"],    // 판매원 이름
               ["-", "-", "mary", "edward", "mary", "mary", "jaimie", "edward"],        // 가입시킨 사람(부모)
               ["young", "john", "tod", "emily", "mary"],   // 누가
               [12, 4, 2, 5, 10]))                          // 얼만큼 팔았나

// 이익이 발생한 순간 (부모있고 && 1원 이상)인동안 쭈우욱 계산

func solution(_ enroll:[String], _ referral:[String], _ seller:[String], _ amount:[Int]) -> [Int] {
    var parent = [String:String]()
    var idx = [String:Int]()  // 시간초과 해결을 위해 인덱스 저장
    var cost = [Int](repeating: 0, count: enroll.count)
    for i in 0..<referral.count {
        parent.updateValue(referral[i], forKey: enroll[i])
        idx.updateValue(i+1, forKey: enroll[i])
    }
    
    for i in 0..<seller.count {
      // 배열의 firstIndex(of:) O(n) 시간초과
//        var idx = enroll.firstIndex(of: seller[i])!
        var p = parent[seller[i]]
        var amount = amount[i] * 100
        cost[idx[seller[i]]!-1] += amount - amount / 10
        
        while p != "-" && amount > 0 {
//            idx = enroll.firstIndex(of: p!)!
            amount /= 10
            cost[idx[p!]!-1] += amount - amount / 10
            p = parent[p!]
        }
    }
    
    return cost
}
