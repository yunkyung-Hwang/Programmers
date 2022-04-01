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


//ver2) filter 사용
/*
import Foundation

func solution(_ s:String) -> [Int] {
    var num: String = s
    var result = [0,0]
    
    while num != "1" {
        result[0] += 1
        num = String(num.filter{
            if $0 == "0" { result[1] += 1 }
            return $0 != "0"
        }.count, radix: 2)
    }
    
    return result
}
*/
