// 문장을 띄어쓰기 기준으로 쪼개고
// 첫 알파벳 단어를 찾아
// 첫글자 대문자로
// 반환

func solution(_ s:String) -> String {
    var arr = s.components(separatedBy: " ")
    
    for i in 0..<arr.count {
        arr[i] = capitalizingFirstLetter(arr[i])
    }
    
    return arr.joined(separator: " ")
}

func capitalizingFirstLetter(_ s: String) -> String {
    if s.length == 0 { return ""}
    let first = String(s[s.startIndex]).uppercased()
    let other = String(s.dropFirst()).lowercased()
    return first + other
}
