import Foundation

// 50m

// 문제
// 실수 가능
// - O놓을 차롄데 X놓거나 그 반대
// - 누군가 이겨서 게임이 종료된 상황에도 계속 진행
// 게임판이 주어졌을때 가능한 상황인지 아닌지 판단

// 풀이
// 어차피 3x3 배열이면 가능한 상황 다 만들어서 포함하는지 확인
// 가능한 <= 9^3개의 보드판
// 선공이 O

func solution(_ board:[String]) -> Int {
    // 가능한 보드판
    var possible = Set<String>()
    
    // 승리한 사람이 있는지 판단하는 메서드
    func checkEnd(_ board: [[String]]) -> Bool {
        for i in 0..<3 {
            if board[i][0] != ".", 
            board[i][0] == board[i][1], 
            board[i][1] == board[i][2]  {
                return true
            }
            if board[0][i] != ".", 
            board[0][i] == board[1][i], 
            board[1][i] == board[2][i] {
                return true
            }
        }
        
        if board[1][1] != ".", 
        board[0][0] == board[1][1], 
        board[1][1] == board[2][2] {
            return true
        }
        if board[1][1] != ".", 
        board[0][2] == board[1][1], 
        board[1][1] == board[2][0] {
            return true
        }
        
        return false
    }
    var b = [[".",".","."], [".",".","."], [".",".","."]]
    func dfs(_ turn: String) {
        possible.insert(b.flatMap {$0}.joined())
        // 누군가 이겨서 끝났으면
        if checkEnd(b) {
            return
        }
        
        for i in 0..<3 {
            for j in 0..<3 {
                if b[i][j] == "." {
                    b[i][j] = (turn == "O") ? "O" : "X"
                    dfs(turn == "O" ? "X" : "O")
                    b[i][j] = "."
                }
            }
        }
    }
    
    dfs("O")
    
    return possible.contains(board.compactMap{$0}.joined()) ? 1 : 0
}
