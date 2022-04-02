// (구글링)
// 끝자리부터 한 자리 올라갈떄마다 필요한 개수를 미리 세어 배열을 만든다
// 단어 인덱스별로 모음의 순서와 인덱스별 카운트를 곱해서 모두 더한다
// 다음 문자로 이동할 때 하나씩 추가되므로 단어의 개수도 더한다

import Foundation

func solution(_ word:String) -> Int {
    let dic = ["A":0,"E":1,"I":2,"O":3,"U":4]
    let cnt = [781,156,31,6,1]

    return word.enumerated().map{ cnt[$0.offset] * dic[String($0.element)]! }.reduce(word.count) { $0 + $1 }
}
