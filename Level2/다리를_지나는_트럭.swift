// 다리가 가득 차면 result만 증가
// 다리에 자리가 있을 경우 
//    다리 위 트럭들의 합 + 들어가고자 하는 트럭 > 최대 무게라면 dummy 값을 추가한다
//                                     <        라면 트럭을 추가한다
// 마지막 트럭이 다리에 들어갔을때의 result + 다리의 길이(마지막 트럭이 통과하기까지의 시간)을 반환한다

import Foundation

// 풀이 1) 배열 사용
func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var bridge = [Int]()
    var result = 0
    var bridge_weight = 0
    var i = 0

    while i < truck_weights.count {
        result += 1
        if bridge.count == bridge_length {
            bridge_weight -= bridge[0]
            bridge.removeFirst()
        }

        if bridge_weight + truck_weights[i] > weight {
            bridge.append(0)
        } else {
            bridge.append(truck_weights[i])
            bridge_weight += truck_weights[i]
            i += 1
        }
    }

    return result + bridge_length
}

// 풀이 2) 큐 사용
struct Queue<T> {
    var enqueue = [T]()
    var dequeue = [T]()

    var isEmpty: Bool {
        return enqueue.isEmpty && dequeue.isEmpty
    }

    var count: Int {
        return enqueue.count + dequeue.count
    }

    mutating func push(_ element: T) {
        enqueue.append(element)
    }

    mutating func pop() -> T? {
        if dequeue.isEmpty {
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        return dequeue.popLast()
    }
}


func solution2(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var bridge = Queue<Int>()
    var result = 0
    var bridge_weight = 0
    var i = 0

    while i < truck_weights.count {
        result += 1
        if bridge.count == bridge_length {
            bridge_weight -= bridge.pop()!
        }

        if bridge_weight + truck_weights[i] > weight {
            bridge.push(0)
        } else {
            bridge.push(truck_weights[i])
            bridge_weight += truck_weights[i]
            i += 1
        }
    }

    return result + bridge_length
}
