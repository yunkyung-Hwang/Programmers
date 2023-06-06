import Foundation

func solution(_ name:[String], _ yearning:[Int], _ photo:[[String]]) -> [Int] {
    var longing = [String: Int]()
    var result = [Int]()
    for i in 0..<name.count {
        longing[name[i]] = yearning[i]
    }
    
    for photo in photo {
        var r = 0
        for p in photo {
            r += (longing[p] ?? 0)
        }
        result.append(r)
    }
    
    return result
}
