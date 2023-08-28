import Foundation

// 문제
// 병사 n명, 매 라운드 enemy[i]마리의 적 등장. 막으려면 적 수 만큼 병사 소모
// 무적권을 사용하면 한 라운드를 소모 없이 막을 수 있음
// 무적권 최대 k번 사용
// 라운드 <= 백만
// 최대 몇 라운드까지 막을 수 있는가?

// 풀이
// comb -> 백만C백만-k -> 무조건 시간초과
// 우선순위 큐
// 모자랄때 enemy 큐 확인
// 무적권 남아있고 enemy pop한 값과 현재 병사 수를 더한게 

struct Heap<T: Comparable> { 
    var nodes: [T] = []
    let sort: (T, T) -> Bool
    
    init(sort: @escaping (T, T) -> Bool) {
        self.sort = sort
    }
    
    var isEmpty: Bool {
        return nodes.isEmpty
    }
    
    mutating func insert(_ element: T) {
        var index = nodes.count
        nodes.append(element)
        while index > 0 && sort(nodes[index], nodes[(index-1)/2]) {
            nodes.swapAt(index, (index-1)/2)
            index = (index-1)/2
        }
    }
    
    mutating func pop() -> T {
        nodes.swapAt(0, nodes.count-1)
        let poped = nodes.removeLast()
        var index = 0

        while index * 2 + 1 < nodes.count {
            let leftChild = index * 2 + 1
            let rightChild = leftChild + 1
            
            if rightChild < nodes.count {
                let child = sort(nodes[leftChild], nodes[rightChild]) ? leftChild : rightChild
                
                if sort(nodes[child], nodes[index]) {
                    nodes.swapAt(child, index)
                    index = child
                } else {
                    break
                }
            } else { 
                if sort(nodes[leftChild], nodes[index]) {
                    nodes.swapAt(leftChild, index)
                    index = leftChild
                } else {
                    break
                }
            }
        }
        return poped
    }
}

func solution(_ n:Int, _ k:Int, _ enemy:[Int]) -> Int {
    var h = Heap<Int>(sort: >)
    var n = n, k = k
    var result = 0
    
    for enemy in enemy {
        h.insert(enemy)
        if n - enemy >= 0 {
            n -= enemy
        } else if k > 0 {
            n = n - enemy + h.pop()
            k -= 1
        } else {
            break
        }
        result += 1
    }
    
    return result
}
