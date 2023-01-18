import Foundation

// 테스트케이스 6번 자료형 에러
// 해결을 위해 i 먼저 곱하기

func solution(_ w:Int, _ h:Int) -> Int64{
    var answer: Int64 = Int64(w * h)
//     let lean = Double(h) / Double(w)
    var y = 0
    
    for i in 1...w {
        let y2 = Int(ceil(Double(h) * Double(i) / Double(w)))
//         let y2 = Int(ceil(lean * Double(i)))
        answer -= Int64(y2 - y)
        y = Int(floor(Double(h) * Double(i) / Double(w)))
//         y = Int(floor(lean * Double(i)))
    }

    return answer
}
