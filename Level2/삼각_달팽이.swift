import Foundation

func solution(_ n:Int) -> [Int] {
    var cnt = 0
    for i in 1...n {
        cnt += i
    }
    var result  = [Int](repeating: 0, count: cnt)
    
    var times = 0
    var index = 0
    var num = 1
    while num <= cnt {
        if num == cnt || index < 0 { break }
        for i in 1..<n-1-times*3+1 {
            result[index] = num
            index += i + (times * 3) - times
            num += 1
        }
        for _ in 0..<n-1-times*3 {
            result[index] = num
            index += 1
            num += 1
        }
        for i in 0..<n-1-times*3 {
            result[index] = num
            if i == n-2-times*3 {
                index += 2 * (times + 1)
            } else {
                index -= n - i - times
            }
            num += 1
        }
        times += 1
    }
    
    if num <= cnt && result[index] == 0 {
        result[index] = num
    }
    
    return result
}
