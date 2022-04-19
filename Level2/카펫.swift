// 카펫의 사이즈를 구한다 yellow + brown
// 3이상의 높이로 나누어 떨어지는 너비값들을 구한다
// 너비값들 중 (너비 - 2) * (높이 - 2) 값이 yellow 사이즈와 동일한 너비, 높이를 탐색한다

import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    let size = brown + yellow
    var widths = [Int]()
    var height = 3
    
    while height <= size / height {
        if size % height == 0 {
            widths.append(size/height)
        }
        height += 1
    }
    
    for width in widths {
        if (width - 2) * (size / width - 2) == yellow {
            return [width, size / width]
        }
    }
    
    return []
}
