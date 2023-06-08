import Foundation

// 문제
// 귤을 크기별로 분류했을때 서로 다른 종류의 수를 최소화

// 풀이
// 딕셔너리 종류(크기): 개수 생성 후 value기준 내림차순

// 시간복잡도
// tangerine <= 천만, 정렬 & tangerine 종류 탐색
// O(천만)

// 5m -> 통과

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    var d = [Int: Int]()
    for t in tangerine {
        d[t] = (d[t] ?? 0) + 1
    }

    var cnt = k
    var result = 0
    for t in d.sorted(by: { $0.value > $1.value }) {
        if cnt <= 0 { break }
        cnt -= t.value
        result += 1
    }

    return result
}
