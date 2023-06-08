import Foundation

// 풀이
// 문자열길이 -> 백만 not 완탐
// 스택 LIFO
// O(n)탐색 후 스택이 비어있는가를 return

func solution(_ s:String) -> Int {
    var stack = [Character]()
    
    for c in Array(s) {
        if let last = stack.last, last == c {
            stack.removeLast()
        } else {
            stack.append(c)
        }
    }

    return stack.isEmpty ? 1 : 0
}
