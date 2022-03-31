// ver1)
// 홀수면 하나 작은 짝수로 바꾸고 정답 cnt에 1을 더한다
// 짝수면 반을 나눈다(순간이동)
// 0이 될 때까지 반복한다

import Foundation

func solution(_ n:Int) -> Int
{
    var ans:Int = 0
    var tmp = n
    
    while(tmp > 0) {
        if tmp % 2 == 1 {
            tmp -= 1
            ans += 1
        } else {
            tmp /= 2
        }
        
        /*
        if tmp % 2 == 1 {
            ans += 1
        }
        // 어차피 int형이라 1 안빼도 알아서 버려짐
        tmp /= 2
        */
    }

    return ans
}

// ver2)
/*
import Foundation

func solution(_ n:Int) -> Int
{
    if n == 1 { return 1 }
    if n % 2 == 0 { return solution(n/2) }
    return solution(n/2) + 1
}
*/
