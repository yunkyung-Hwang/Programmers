import Foundation

// 2차원 배열 -> 1차원 배열
// joined 보단 flatMap 사용

// Int64와 Int는 사용하는 시스템 아키텍처에 따라 지정
// 64bit 아키텍처에서는 둘이 동일

func solution(_ land:[[Int]], _ p:Int, _ q:Int) -> Int64 {
    let land = land.flatMap { $0 }.sorted()
//    let land = Array(land.joined()).sorted()  // 효율성 시간 초과
    var add = 0
    var sub = land.reduce(0, +) - land[0] * land.count
    var result = sub * q
    
    if land.count > 1 {
        for i in 1..<land.count {
            if land[i] == land[i-1] { continue }
            
            add += (land[i] - land[i-1]) * i
            sub -= (land[i] - land[i-1]) * (land.count - i)
            result = min(result, add * p + sub * q)
        }
    }
    
    return Int64(result)
}
