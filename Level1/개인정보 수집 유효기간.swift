import Foundation

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    var result = [Int]()
    var termsDictionary: [String: Int] = [:]
    let today = today.toDate()!
    
    for term in terms {
        let term = term.split(separator: " ").map { String($0) }
        termsDictionary[term[0]] = Int(term[1])!
    }
    
    var idx = 1
    for privacy in privacies {
        let privacy = privacy.split(separator: " ").map { String($0) }
        let date = privacy[0].toDate()!
        let code = privacy[1]
        
        guard let validity = termsDictionary[code],
              let expiration = Calendar.current.date(byAdding: .month, value: validity, to: date)
        else { continue }
        
        if today >= expiration {
            result.append(idx)
        }
        idx += 1
    }
    
    return result
}

extension String {
    func toDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        if let date = dateFormatter.date(from: self) {
            return date
        } else {
            return nil
        }
    }
}
