import Foundation

// 문제
// 파일 전부 삭제
// 최소한의 이동거리를 갖는 한 번의 드래그로 모든 파일 삭제
// 시작점과 끝점 찾기

func solution(_ wallpaper:[String]) -> [Int] {
    var w = [[Bool]](repeating: [Bool](repeating: false, count: wallpaper[0].count), count: wallpaper.count)
    typealias Point = (x: Int, y: Int)
    var s: Point = (wallpaper.count, wallpaper[0].count)
    var e: Point = (0, 0)
    for i in 0..<wallpaper.count {
        w[i] = wallpaper[i].map { $0 == "#" }
        for j in 0..<w[i].count {
            if w[i][j] {
                s.x = min(s.x, i)
                s.y = min(s.y, j)
                e.x = max(e.x, i)
                e.y = max(e.y, j)
            }
        }
    }
    
    
    return [s.x, s.y, e.x + 1, e.y + 1]
}
