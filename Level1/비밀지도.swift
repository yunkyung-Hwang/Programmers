// 14m
// 히든 2개 틀렸습니다 - 타입 에러
// String(format: "%0nld") not d
func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
    var map1 = arr1.map { String(format: "%0\(n)ld", Int(String($0, radix: 2))!) }
    var map2 = arr2.map { String(format: "%0\(n)ld", Int(String($0, radix: 2))!) }
    
    for i in 0..<n {
        var ans = ""
        let m1 = map1[i].map { String($0) }
        let m2 = map2[i].map { String($0) }
        
        for j in 0..<n {
            if m1[j] == "1" || m2[j] == "1" {
                ans += "#"
            } else {
                ans += " "
            }
        }
        answer.append(ans)
    }
    
    return answer
}
