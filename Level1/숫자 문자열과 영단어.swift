import Foundation

func solution(_ s:String) -> Int {
    var s = s
    let num = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    let word = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
    
    for i in 0..<10 {
        s = s.replacingOccurrences(of: word[i], with: num[i])
    }
    
    return Int(s)!
}
