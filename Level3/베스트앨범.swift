import Foundation

// 문제
// 장르 별로 가장 많이 재생된 노래를 두 개씩 모아
// 1. 장르
// 2. 재생횟수
// 3. 재생회수가 같으면 고유번호 낮은거

struct Song: Hashable {
    let num: Int
    let plays: Int
}
func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var g = [String: [Song]]()
    var cnt = [String: Int]()
    var result = [Int]()
    for i in 0..<genres.count {
        cnt[genres[i]] = (cnt[genres[i]] ?? 0) + plays[i]
        g[genres[i]] = (g[genres[i]] ?? []) + [Song(num: i, plays: plays[i])]
    }
    
    for genre in cnt.sorted(by: { $0.value > $1.value }) {
        var count = 0
        
        for song in g[genre.key]!.sorted(by: {($0.plays > $1.plays) || ($0.num < $1.num)}) {
            result.append(song.num)
            count += 1
            if count >= 2 { break }
        }
    }
    
    return result
}
