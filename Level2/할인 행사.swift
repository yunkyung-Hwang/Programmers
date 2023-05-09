import Foundation

// 문제
// 돈 내면 10일동안 회원
// 회원을 대상으로 매일 한 가지 할인
// 할인 제품은 하루 한 개만 구입 가능
// 원하는 제품과 수량이 할인하는 날짜와 10일 연속으로 일치할 경우 회원가입

// 풀이
// 슬라이딩윈도우

func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
    var result = 0
    typealias wd = [String: Int]
    var d = wd()
    var w = wd()
    for i in 0..<want.count {
        w[want[i]] = number[i]
    }
    
    for i in 0..<10 {
        d[discount[i]] = (d[discount[i]] ?? 0) + 1
    }
    
    var s = 0
    for e in 9..<discount.count {
        var cnt = 0
        // 확인
        for bought in d {
            if w[bought.key] != nil && w[bought.key]! <= bought.value {
                cnt += 1
            }
        }
        
        if cnt >= want.count { result += 1 }
        
        if s < discount.count && e+1 < discount.count {
            d[discount[s]]? -= 1
            d[discount[e+1]] = (d[discount[e+1]] ?? 0) + 1
        }
        s += 1
    }
    
    return result
}
