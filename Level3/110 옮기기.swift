import Foundation
func solution(_ s:[String]) -> [String] {
    var results = [String]()
    
    for s in s {
        // 1. 110 다 빼기
        // 1-1) 시간초과
//        while tmp.contains("110") {
//            tmp = tmp.components(separatedBy: "110").joined()
//        }
        // 1-2) 스택 사용
        var stack = [String]()
        for num in s {
            if num == "0" && stack.count > 1 && stack[stack.count - 2] == "1" && stack.last == "1" {
                stack.removeLast()
                stack.removeLast()
            } else {
                stack.append(String(num))
            }
        }
        let tmp = stack.joined()
        
        
        // 2. 110의 개수만큼 110문자열 만들기
        let oneOneZeros = String(repeating: "110",
                                 count: (s.count - tmp.count) / 3)
        
        // 3. 남은 문자열에서 0이 있다면 마지막 0 뒤에 붙이기 0이 없다면 맨앞에 붙이기
        var result:String = ""
        if let lastIdxOf0 = tmp.lastIndex(of: "0") {
            result += tmp[...lastIdxOf0] + oneOneZeros + tmp[tmp.index(lastIdxOf0, offsetBy: 1)...]
        } else {
            result = oneOneZeros + tmp
        }
        
        results.append(result)
    }
    
    return results
}
