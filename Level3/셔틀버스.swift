// 문제
// 셔틀 운영
// 09:00부터 총 n회 t분 간격으로 역에 도착.
// 셔틀에는 최대 m명 탑승
// 콘이 셔틀을 타고 사무실로 갈 수 있는 도착 시간 중 제일 늦은 시각 구하기
// 콘은 같은 시각 도착한 대기열 중 제일 뒤에 선다.
// timeTable: 크루가 대기열에 도착하는 시간

// 풀이
// 생각할 반례가 갱장히 많았던 문제
// - 냅다 정렬해서 잘라도 안됨. 타는 시간 봐야댐
// - 9시에 줄 선 사람이 4명이고 한 번에 탈 수 있는 사람 수가 2명이면 9시에 온 애들도 다음 버스 타야댐
// - 가장 빠른 시간에 타는 계산(onboardTime) 한 번 틀림

func minuteToTime(_ minute: Int) -> String {
    let h = String(format: "%02d", minute / 60)
    let m = String(format: "%02d", minute % 60)
    return "\(h):\(m)"
}

func timeToMinute(_ time: String) -> Int {
    let time = time.split(separator: ":").map { Int(String($0))! }
    return time[0] * 60 + time[1]
}
    
func onboardTime(_ t: Int, _ time: String) -> String {
    let minute = timeToMinute(time)
    if minute < 9 * 60 {
        return "09:00"
    } else {
        let tmp = minute - 9 * 60
        return tmp % t == 0 ? time : minuteToTime(minute + t - tmp % t)
    }
}

func solution(_ n:Int, _ t:Int, _ m:Int, _ timetable:[String]) -> String {
    var timeD = [String: [String]]() // 최대 사이즈 600
    for i in 0..<n {
        let busTime = minuteToTime(9 * 60 + i * t)
        timeD[busTime] = []
    }
    
    for p in timetable.sorted() {
        // 제일 빠른 탑승 시간
        var onboard = timeToMinute(onboardTime(t, p))
        
        while timeD[minuteToTime(onboard)] != nil && timeD[minuteToTime(onboard)]!.count >= m {
            onboard += t
        }
        
        if timeD[minuteToTime(onboard)] == nil { break }
        timeD[minuteToTime(onboard)]! += [p]
    }
    
    let lastBus = timeD.sorted(by: {$0.key < $1.key}).last!
    if lastBus.value.count >= m {
        return minuteToTime(timeToMinute(lastBus.value.sorted()[m-1]) - 1)
    } else {
        return lastBus.key
    }
}
