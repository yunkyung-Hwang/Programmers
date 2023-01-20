import Foundation

func solution(_ storey:Int) -> Int {
    var num = storey
    var idx = 1
    var result = 0
    
    while num != 0 {
        let digit = num % (idx * 10) / idx
        
        if digit < 5 {
            result += digit
            num -= digit * idx
        } else if digit > 5 {
            result += 10 - digit
            num += (10 - digit) * idx
        } else { // == 5
            let next = num % (idx * 100) / (idx * 10)
            if next < 5 {
                result += digit
                num -= digit * idx
            } else {
                result += 10 - digit
                num += (10 - digit) * idx
            }
        }
        
        idx *= 10
    }
    
    return result
}
