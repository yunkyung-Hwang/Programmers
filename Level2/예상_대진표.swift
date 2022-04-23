import Foundation

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int
{
    var answer = 0
    var a = a
    var b = b
    
    while a != b {
        answer += 1
        a = a % 2 == 0 ? a / 2 : a / 2 + 1
        b = b % 2 == 0 ? b / 2 : b / 2 + 1
    }
    return answer
}
