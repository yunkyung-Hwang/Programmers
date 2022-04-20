// 수학문제(?)
// [옷 종류 : 옷 가지수] dictionary 생성
// (종류1 개수 + 1) * (종류2 개수 + 1) * ... * (종류3 개수 + 1) - 1

import Foundation

func solution(_ clothes:[[String]]) -> Int {
    let clothes = clothes.sorted(by: {$0[1] > $1[1]})
    var kindOfClothes = [String : Int]()
    var result = 1

    for clothe in clothes {
        if kindOfClothes.keys.contains(clothe[1]) {
            kindOfClothes[clothe[1]]! += 1
        } else {
            kindOfClothes.updateValue(1, forKey: clothe[1])
        }
    }
    
    for (_, value) in kindOfClothes {
        result *= (value + 1)
    }
    
    return result - 1
}
