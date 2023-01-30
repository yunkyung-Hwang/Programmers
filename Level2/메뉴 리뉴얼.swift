import Foundation

print(solution(["ABCFG", "AC", "CDE", "ACDE", "BCFG", "ACDEH"], [2,3,4]), "\n")
print(solution(["ABCDE", "AB", "CD", "ADE", "XYZ", "XYZ", "ACD"], [2,3,5]), "\n")
print(solution(["XYZ", "XWY", "WXA"], [2,3,4]), "\n")

// 조합
// 매 order에서 course에 해당하는 개수만큼 조합 배열 만들기
// 딕셔너리 개수가 2개 이상인 애들만 출력 이 아니라
// course 사이즈 중 최대 애들만 (겹치면 다)

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    var comb = [String: Int]()
    var result = [String]()
    
    for order in orders {
        let order = Array(order).map { String($0) }.sorted()
        
        for cnt in course {
            let menu = combination(order, cnt)
            for m in menu {
                let m = m.joined()
                comb.updateValue((comb[m] ?? 0) + 1, forKey: m)
            }
        }
    }
    
    var cnt = course[0]
    var max = 0
    for comb in comb.sorted(by: {
        if $0.key.count == $1.key.count { return $0.1 > $1.1 }
        return $0.key.count < $1.key.count }) {
        if comb.value == 1 { continue }
        
        // 최대값만 결과에 추가
        if cnt < comb.key.count {
            cnt = comb.key.count
            max = 0
        }
        if max <= comb.value {
            max = comb.value
            result.append(comb.key)
        }
    }
    
    return result.sorted()
}

func combination(_ array: [String], _ n: Int) -> [[String]] {
    var result = [[String]]()
    if array.count < n { return result }

    func cycle(_ index: Int, _ now: [String]) {
        if now.count == n {
            result.append(now)
            return
        }
        
        for i in index..<array.count {
            cycle(i + 1, now + [array[i]])
        }
    }
    
    cycle(0, [])
    
    return result
}
