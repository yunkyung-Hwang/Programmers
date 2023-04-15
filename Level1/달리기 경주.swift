import Foundation

func solution(_ players:[String], _ callings:[String]) -> [String] {
    var players = players
    var rank = [String: Int]()
    
    var r = 0
    for player in players {
        rank[player] = r
        r += 1
    }
    
    for p in callings {
        let index = rank[p]!
        rank[players[index-1]] = index
        rank[p] = index - 1
        
        players.swapAt(index, index-1)
    }
    
    return players
}
