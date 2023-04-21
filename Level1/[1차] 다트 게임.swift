// 문제
// 세 번 던진 점수의 합
// S(1제곱), D(2제곱), T(3제곱)영역
// * - 해당 점수와 바로 전에 얻은 점수를 2배(첫번째의 경우 첫번째만 2배 / 중첩 가능(4배))
// # - 해당 점수 마이너스
// * + # : -2배

// 두 자리 숫자 예외처리 잘 하기

func solution(_ dartResult:String) -> Int {
    let d = dartResult.map { String($0) }
    var nums = [Int]()
    var num = 0
    var idx = -1
    
    var i = 0
    while i < d.count {
        if Int(d[i]) != nil {
            if d[i] == "1" && i+1 < d.count && d[i+1] == "0" {
                num = 10
                i += 1
            } else {
                num = Int(d[i])!
            }
            idx += 1
        } else if d[i] == "S" {
            nums.append(num)
        } else if d[i] == "D" {
            nums.append(num * num)
        } else if d[i] == "T" {
            nums.append(num * num * num)
        } else if d[i] == "*" {
            nums[idx] *= 2
            if idx-1 >= 0 {
                nums[idx-1] *= 2
            }
        } else if d[i] == "#" {
            nums[idx] = nums[idx] * -1
        }
        i += 1
    }
    
    return nums.reduce(0, +)
}
