import Foundation

// 문제
// 두 단어 begin, target과 단어 집합 words가 있다.
// begin에서 target으로 만들기
// 한 번에 한 개의 알파벳만 바꿀 수 있다.
// words에 있는 단어로만 변환할 수 있다.
// 최소 과정을 거쳐 begin을 target으로 변경할 때 몇 단계가 필요한가?

// 풀이
// 단어 길이 <= 10
// bfs
// 한 글자만 바꿔서 words에 들어있는 문자를 만들 수 있는가 판단
// 만들 수 있다면 큐에 넣기

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    var visit = Set<String>()
    var result = Int.max
    
    var queue = [(0, begin)]
    var qIdx = 0
    
    while qIdx < queue.count {
        let str = queue[qIdx]
        qIdx += 1
        visit.insert(str.1)
        
        for i in 0..<words.count {
            if !visit.contains(words[i]) && canChange(from: str.1, to: words[i]) {
                if words[i] == target {
                    result = min(result, str.0 + 1)
                }
                visit.insert(words[i])
                queue.append((str.0 + 1, words[i]))
            }
        }
    }
    
    return result == Int.max ? 0 : result
}

func canChange(from s1: String, to s2: String) -> Bool {
    let s1 = s1.map { String($0) }
    let s2 = s2.map { String($0) }
    
    var difference = 0
    for i in 0..<s1.count {
        if s1[i] != s2[i] {
            difference += 1
        }
    }
    
    return difference == 1
}
