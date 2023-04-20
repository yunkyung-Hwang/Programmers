import Foundation

// id_list: 사용자 닉네임 목록
// report: A가 B를 신고
// 각 유저가 받은 메일 수를 반환
// 누구를 신고했고 그 중 몇명이 정지당했는지

// ‼️한 사람이 여러번 신고한 부분 처리 -> report를 Set(report)로 처리‼️

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var banList = [String: [String]]()
    var reportCnt = [String: Int]()
    
    for report in Set(report) {
        let users = report.split(separator: " ").map { String($0) }
        banList[users[0]] = (banList[users[0]] ?? []) + [users[1]]
        reportCnt[users[1]] = (reportCnt[users[1]] ?? 0) + 1
    }
    
    var result = [Int]()
    for id in id_list {
        var cnt = 0
        for blockedUser in (banList[id] ?? []) {
            if reportCnt[blockedUser] ?? 0 >= k {
                cnt += 1
            }
        }
        result.append(cnt)
    }
    
    return result
}
