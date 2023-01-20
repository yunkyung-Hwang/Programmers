import Foundation

func solution(_ n:Int, _ stations:[Int], _ w:Int) -> Int{
    var answer = 0
    var s = 0
    let size = Double(2 * w + 1)
    
    for station in stations {
        answer += Int(ceil(Double(station - w - 1 - s) / size))
        s = station + w
    }
    
    if s < n { answer += Int(ceil(Double(n - s) / size)) }
    
    return answer
}
