import Foundation

func solution(_ book_time:[[String]]) -> Int {
    var bt = [[Int]](repeating: [Int](repeating: 0, count: 2), count: book_time.count)
    
    for i in 0..<book_time.count {
        var tmp = book_time[i][1].components(separatedBy:":").map { Int($0)! }
        tmp[1] += 10
        if tmp[1] >= 60 { 
            tmp[0] += 1 
            tmp[1] -= 60
        }
        bt[i][0] = toMinute(book_time[i][0])
        bt[i][1] = toMinute("\(tmp[0]):\(tmp[1])")
    }
    
    bt.sort { $0[0] < $1[0] }
    
    var end = [Int]()
    for b in bt {
        var flag = false
        for i in 0..<end.count {
            if end[i] <= b[0] { 
                flag = true
                end[i] = b[1]
                break
            }
        }
        
        if !flag { end.append(b[1]) }
        
        end.sort()
    }
    return end.count
}

func toMinute(_ time: String) -> Int {
    let tmp = time.components(separatedBy:":").map{ Int($0)! }
    return tmp[0] * 60 + tmp[1]
}
