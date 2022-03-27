// n이 10000이하니까 반복문으로 풀어도 무방하겠다
// 시작값을 1부터하고 하나씩 증가해서 빼준다
// 나머지가 0인 경우만 해당 조건에 부합하는 경우이므로 result 값을 증가
// (조건에 맞지 않으면 tmpN 값이 음수)
// 시작값이 n이 될 때까지 반복한다

import Foundation

func solution(_ n: Int) -> Int {
    var tmpN = n
    var result = 0
    
    for i in 0...n {
        var start = i
        while tmpN > 0 {
            start += 1
            tmpN -= start
        }
        if tmpN == 0 { result += 1}
        tmpN = n
    }
    
    return result
}

print(solution(15))


// swift 지원 안해주는 프로그래머스 채점을 위한 C++ 풀이
// 오랜만에 세미콜론 찍기 빡세다

// #include <string>
// #include <vector>

// using namespace std;

// int solution(int n) {
//     int answer = 0;
//     int tmpN = n;
    
//     for(int i = 0; i <= n; i++) {
//         int start = i;
//         while (tmpN > 0) {
//             start += 1;
//             tmpN -= start;
//         }
//         if(tmpN == 0) { answer += 1; }
//         tmpN = n;
//     }
    
//     return answer;
// }
