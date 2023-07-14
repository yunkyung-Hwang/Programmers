import Foundation

// 문제
// 자신보다 뒤에 있는 숫자 중에 자신보다 크면서 가장 가까이에 있는 수
// 존재하지 않으면 -1

func solution(_ numbers:[Int]) -> [Int] {
    var result = [Int](repeating: -1, count: numbers.count)
    var stack: [Int] = [0]
    
    for i in 0..<numbers.count {
        while !stack.isEmpty && numbers[stack.last!] < numbers[i] {
            result[stack.removeLast()] = numbers[i]
        }
        stack.append(i)
    }
    
    return result
}
