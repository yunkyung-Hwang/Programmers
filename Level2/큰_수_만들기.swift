// k > 0 인 동안 number을 순차적으로 탐색
// result에 담겨있는 마지막 자리 숫자보다 들어오는 숫자가 크면 마지막 숫자 삭제 후 추가
// 작거나 같으면 추가
// k > 0 이지만 내림차순으로 정렬되어있는경우 마지막 k자리수 삭제

import Foundation

func solution(_ number:String, _ k:Int) -> String {
    var result = ""
    var k = k
    let nums = Array(number.map{ String($0) })
    
    for num in nums {
        while k > 0 && result != "" && String(result.last!) < num {
            result.removeLast()
            k -= 1
        }
        result += num
    }
    
    while k > 0 {
        result.removeLast()
        k -= 1
    }
    
    return result
}
