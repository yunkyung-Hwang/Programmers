import Foundation

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    var payout: [String:Int] = [:]
    var carIN: [String:Int] = [:]
    var result = [Int]()
    
    for record in records {
        let r = record.split(separator: " ").map { String($0) }
        let t = r[0].split(separator: ":").map { Int(String($0))! }
        let carNum = r[1]
        let status = r[2] == "IN" ? true : false
        let time = t[0] * 60 + t[1]
        
        if status { // in
            carIN[carNum] = time
        } else {    // out
            let resultTime = time - carIN[carNum]!
            payout.updateValue((payout[carNum] ?? 0) + resultTime, forKey: carNum)
            carIN[carNum] = nil
        }
    }
    
    for car in carIN {
        payout.updateValue((payout[car.key] ?? 0) + 23 * 60 + 59 - car.value, forKey: car.key)
    }
    
    for pay in payout.sorted(by: { $0.0 < $1.0 }) {
        var div = (pay.value - fees[0]) / fees[2]
        div += (pay.value - fees[0]) % fees[2] == 0 ? 0 : 1
        result.append(pay.value <= fees[0] ? fees[1] : div * fees[3] + fees[1])
    }
    
    return result
}
