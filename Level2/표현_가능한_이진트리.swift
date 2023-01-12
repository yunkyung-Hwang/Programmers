import Foundation

func solution(_ numbers:[Int64]) -> [Int] {
    var binaryNumbers = numbers.map { String($0, radix: 2) }
    var results = [Int](repeating: 1, count: numbers.count)
    
    for b in 0..<binaryNumbers.count {
        var tmp = ""
        for _ in 0..<getTopNode(binaryNumbers[b].count) * 2 - 1 - binaryNumbers[b].count {
            tmp.append("0")
        }
        binaryNumbers[b] = tmp + binaryNumbers[b]
        
        if !check(binaryNumbers[b]) {
            results[b] = 0
        }
    }
    
    return results
}

func getTopNode(_ num: Int) -> Int {
    var result: Double = 0
    var num = num
    while num > 0 {
        num /= 2
        result += 1
    }
    
    return Int(pow(Double(2), result - 1))
}


func check(_ b: String) -> Bool {
    var result = true
    
    let midIdx = (b.count - 1) / 2
    let mid = b[midIdx]
    let l = String(b[0..<midIdx])
    let r = String(b[midIdx+1..<b.count])
    
    if mid == "0" && (l[(l.count-1)/2] == "1" || r[(r.count-1)/2] == "1") { return false }
    
    if l.count >= 3 {
        result = check(l)
        if result { result = check(r) }
    }
    
    return result
}

extension String {
    subscript(idx: Int) -> String? {
        return String(self[index(startIndex, offsetBy: idx)])
    }
    
    subscript(_ range: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: max(0, range.lowerBound))
        let end = index(startIndex, offsetBy: min(self.count, range.upperBound))
        return String(self[start..<end])
    }
}
