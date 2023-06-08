// 참고: https://onlydev.tistory.com/65
// 배열에 1이 없으면 => return 0
// 행 또는 열의 길이가 1이하면 => return 1
// 현재 칸이 0이 아닐 경우
// * 현재 칸 기준 왼쪽, 왼쪽 위, 위쪽을 확인하여 그 중 최솟값 + 1을 현재 칸에 할당한다.
// * 반복문을 순차적으로 진행하면서 이미 이전 값들은 뻗어나갈 수 있는 값들이 저장되어있기때문에
// * 현재 칸에서 왼, 왼위, 위로 모두 뻗어나갈 수 있는지 체크하기 위한 로직

// +) 땅따먹기 문제랑 비슷한 느낌이였는데 둘 다 DP문제
//    시간복잡도 빡세면 DP를 고민해보자

// 2022.03.27 풀이 1)
// import Foundation

// func solution(_ board:[[Int]]) -> Int
// {
//     var answer:Int = 0
//     var tmp = board
//     var isThereOne = false
//     for i in 0..<board.count {
//         if board[i].contains(1) { 
//             isThereOne = true
//             break
//         }
//     }
//     if !isThereOne { return 0 }
//     if board.count < 2 || board[0].count < 2 { return 1 }
    
//     for i in 1..<board.count {
//         for j in 1..<board[0].count {
//             if tmp[i][j] == 0 { continue }
//             tmp[i][j] = min(tmp[i-1][j-1], tmp[i-1][j], tmp[i][j-1]) + 1
//             answer = (tmp[i][j] > answer) ? tmp[i][j] : answer
//         }
//     }
    
//     return answer * answer
// }

mport Foundation

// 문제
// 1로 이루어진 가장 큰 정사각형의 넓이 구하기

// 풀이
// 현 좌표(1)의 (왼, 위, 왼위) 중 최소값 + 1

// 15m -> 시간 초과

// 반례
// 틀림 - 1인곳에서만 확인
// 시간초과 - 두 번 돌지말고 한 번 돌때 answer 초기화까지 같이

// 25m

func solution(_ board:[[Int]]) -> Int
{
    var b = board
    var answer:Int = 0
    for i in 0..<b.count {
        for j in 0..<b[0].count {
            if board[i][j] == 1 && i-1 >= 0 && j-1 >= 0 {
                b[i][j] = min(b[i-1][j-1], min(b[i-1][j], b[i][j-1])) + 1
            }
            answer = max(answer, b[i][j])
        }
    }

    return answer * answer
}
