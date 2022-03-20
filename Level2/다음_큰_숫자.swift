import Foundation

func solution(_ n:Int) -> Int {
    
    let binary = String(n, radix: 2)
    let cnt = binary.filter{ $0 == "1"}.count
    var answer = n + 1
    
    while(true) {
        if cnt == String(answer, radix: 2).filter{ $0 == "1"}.count {
            break
        } else {
            answer += 1
        }
    }
    
    return answer
}
