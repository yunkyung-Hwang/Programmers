// 유클리드 호제법
// 2개씩 나눠서 진행
// reduce

func gcd(_ num1: Int, _ num2: Int) -> Int {
    var a = max(num1, num2)
    var b = min(num1, num2)

    while(a % b != 0) {
        let r = a % b
        a = b
        b = r
    }
    
    return b
}

func lcm (_ num1: Int, _ num2: Int) -> Int {
    return num1 * num2 / gcd(num1, num2)
}

func solution(_ arr:[Int]) -> Int {
    return arr.reduce(1) { lcm($0, $1) }
}
