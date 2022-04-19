/*
H-지수 구하는 방법
자신이 저널에 등재한 전체 논문중 많이 인용된 순으로 정렬한 후, 
피인용수가 논문수와 같아지거나 피인용수가 논문수보다 작아지기 시작하는 숫자가 바로 나의 h가 됩니다. 
출처: [BRIC Bio통신원] [연구논문을 위한 핵심 10단계] H-지수(H-Index) 란 무엇인가? ( https://www.ibric.org/myboard/read.php?Board=news&id=270333 )
*/

import Foundation

func solution(_ citations:[Int]) -> Int {
    var result = 0
    let citations = citations.sorted(by: >)
    for i in 0..<citations.count {
        if i + 1 >= citations[i] {
            if i + 1 == citations[i] { return i + 1 }
            else { return i }
        }
    }
    result = citations.count
    return result
}
