// 가장 작은 자리수의 0을 1로 바꾼다
// 0이 마지막 인덱스가 아닐 경우 바꾼 자리의 오른쪽 1을 0으로 바꾼다
// 모두 1로 이뤄진 숫자의 경우 맨 앞에 1을 추가하고 둘째 자리를 0으로 만든다

import Foundation

func solution(_ numbers:[Int64]) -> [Int64] {
    var result = [Int64](repeating: 0, count: numbers.count)
    
    for i in 0..<numbers.count {
        var num = Array(String(numbers[i], radix: 2)).map { String($0) }
        
        if num.lastIndex(of: "0") != nil {
            let index = num.lastIndex(of: "0")!
            num[index] = "1"
            if index != num.endIndex - 1 { num[index + 1] = "0" }
        } else {
            num[0] = "0"
            num.insert("1", at: 0)
        }
        result[i] = Int64(num.joined(), radix: 2)!
    }
    return result
}
