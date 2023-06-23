import Foundation

// 문제
// 조건 둘 중 하나를 만족하는 가장 큰 양의 정수 구하기
// - 철수의 카드 덱의 공약수 & 영희의 카드 덱의 서로소
// - + 반대
// 숫자가 존재하기만 하면 댐
// 철수와 영희의 카드덱이 주어졌을때 조건을 만족하는 가장 큰 양의 정수 구하기
// 없으면 0

// 풀이 1)
// 최대공약수 구해서 각 최대공약수가 상대 덱을 나눌 수 있는지 확인
// 각 카드덱 <= 오십만개, 원소 <= 억
// 시간복잡도
// 두 개 비교 최대공약수 O(logN) * n-1번

// 인덱스 주의

// 최대공약수
func getGCD(_ n1: Int, _ n2: Int) -> Int {
    if n2 == 0 { return n1 }
    else { return getGCD(n2, n1 % n2) }
}

// 배열 전체의 최대공약수
func getAllNumsGCD(_ arr: [Int]) -> Int {
    var gcd = arr[0]
    // 인덱스 주의의ㅢㅢㅢㅢㅢ
    var idx = 1
    while idx < arr.count {
        gcd = getGCD(gcd, arr[idx])
        idx += 1
    }
    return gcd
}

// 최대공약수가 상대의 덱을 나눌 수 있는가 판단
func check(gcd: Int, arr: [Int]) -> Bool {
    if gcd == 1 { return false }
    for num in arr {
        if num % gcd == 0 {
            return false
        }
    }
    return true
}

func solution(_ arrayA:[Int], _ arrayB:[Int]) -> Int {
    var gcdA = getAllNumsGCD(arrayA)
    var gcdB = getAllNumsGCD(arrayB)
    
    let r1 = check(gcd: gcdA, arr: arrayB) ? gcdA : 0
    let r2 = check(gcd: gcdB, arr: arrayA) ? gcdB : 0
    
    return max(r1, r2)
}
