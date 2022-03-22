// 열리는 괄호라면 +1, 닫히는 괄호라면 -1
// 정상일 경우 openCnt는 항상 0이상
// 음수면 열지 않고 닫은거라서 바로 false
// 0이 아니면 열고 안닫은거라서 false

import Foundation

func solution(_ s:String) -> Bool {
    var openCnt = 0
    for bracket in s {
        openCnt += (bracket == "(") ? 1 : -1
        if openCnt < 0 { break }
    }

    return openCnt == 0 ? true : false
}
