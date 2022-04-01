//ver1) 재귀 함수
import Foundation

var result = [0,0]
func solution(_ s:String) -> [Int] {
    var num: String = ""
    
    if s == "1" { return result }
    else {
        result[0] += 1
        for n in s {
            if n == "0" { result[1] += 1 }
            else { num += "\(n)" }
        }
        num = String(num.count, radix: 2)
        return solution(num)
    }
}
