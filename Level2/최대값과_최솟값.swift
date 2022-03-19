func solution(_ s:String) -> String {
    var arr = s.components(separatedBy: " ").map({(value: String) -> Int in return Int(value)!})
    
    arr.sort()
    
    return "\(arr[0]) \(arr[arr.count - 1])"
}
