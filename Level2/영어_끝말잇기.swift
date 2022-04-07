import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var answer = [0,0]
    var exist = [String](repeating: "", count: words.count)
    exist[0] = words[0]
  
    for i in 1..<words.count{
        if words[i].first != words[i-1].last
            || exist.contains(words[i])
            || words[i].count == 1 {
            answer[0] = i % n + 1
            answer[1] = i / n + 1
            break
        }
        exist[i] = words[i]
    }
    return answer
}
