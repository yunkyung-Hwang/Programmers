import Foundation

print(solution(4, 5, [1, 0, 3, 1, 2], [0, 3, 0, 4, 0]))
print(solution(2, 7, [1, 0, 2, 0, 1, 0, 2], [0, 2, 0, 1, 0, 2, 0]))
print(solution(5, 5, [15, 20, 25, 0, 35], [10, 0, 5, 35, 20]))

func solution(_ cap:Int, _ n:Int, _ deliveries:[Int], _ pickups:[Int]) -> Int64 {
    var car = cap
    var deliveries = deliveries
    var pickups = pickups
    var result: Int64 = 0
    
    while deliveries.count > 0 || pickups.count > 0 {
        while deliveries.last == 0 {
            deliveries.removeLast()
        }
        
        while pickups.last == 0 {
            pickups.removeLast()
        }

        let move = max(deliveries.count, pickups.count)
        
        // 배달
        car = cap
        while !deliveries.isEmpty && car > 0 {
            if deliveries.last! > car {
                deliveries[deliveries.count-1] -= car
                car = 0
            } else {
                car -= deliveries.last!
                deliveries.removeLast()
            }
        }
        
        // 수거
        car = cap
        while !pickups.isEmpty && car > 0 {
            if pickups.last! > car {
                pickups[pickups.count-1] -= car
                car = 0
            } else {
                car -= pickups.last!
                pickups.removeLast()
            }
        }
        
        result += Int64(move * 2)
    }
    
    return result
}
