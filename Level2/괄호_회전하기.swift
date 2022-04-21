import Foundation

func solution(_ s:String) -> Int {
    var parenthesis = Array(s)
    var stack = ""
    var result = 0
    
    for _ in 0..<parenthesis.count {
        var isRight = true
        for p in parenthesis {
            if p == "(" || p == "[" || p == "{" {
                stack += String(p)
            } else if !stack.isEmpty {
                if (stack.last == "(" && p == ")")
                    || (stack.last == "[" && p == "]")
                    || (stack.last == "{" && p == "}") {
                    stack.removeLast()
                } else {
                        isRight = false
                        break
                }
            } else {
                isRight = false
                break
            }
        }
        if !stack.isEmpty { isRight = false }
        if isRight { result += 1 }
        parenthesis.append(parenthesis[0])
        parenthesis.removeFirst()
    }
    return result
}
