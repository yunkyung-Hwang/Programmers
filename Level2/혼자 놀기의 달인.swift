import Foundation

// 문제
// 카드 1~100까지 100장
// 2~100사이의 자연수를 정하고 그 수보다 작거나 같은 카드들을 준비
// 카드 수만큼 상자를 준비. 카드를 한 장씩 넣고 섞어 상자에 넘버링
// 임의의 상자 하나를 선택해 숫자 카드 확인
// 해당 숫자의 상자를 선택해서 숫자 확인.
// 열어야하는 상자가 이미 열려있을때까지 반복
// 종료되면 1번 상자 그룹으로 분리
// 남는 상자가 없을때까지 그룹핑 진행
// 게임 점수는 상자 그룹들의 개수의 곱
// 최대 점수 구하기

// 풀이
// [8,6,3,7,2,5,1,4]
// 1 - 8 4 7 1
// 2 - 6 5 2
// 3 - 3
// 4 - 7 1 8 4
// 5 - 2 6 5
// 6 - 5 2 6
// 7 - 1 8 4 7
// 8 - 4 7 1 8
// 연결된 그룹은 정해져 있음
// 4 / 3 / 1
// 가장 작은 값 제외 곱하기

func solution(_ cards:[Int]) -> Int {
    var visited = [Bool](repeating: false, count: cards.count)
    
    func asdf(_ card: Int) -> Int {
        var count = 0
        var card = card
        while !visited[cards[card]-1] {
            visited[cards[card]-1] = true
            count += 1
            card = cards[card]-1
        }
        
        return count
    }
    
    var group = [Int]()
    for i in 0..<cards.count {
        if !visited[i] { group.append(asdf(i)) }
    }
    
    group.sort(by: >)
    return group.count == 1 ? 0 : group[0] * group[1]
}
