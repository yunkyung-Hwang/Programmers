// ver 1) 제시된 조건 상 시간복잡도 신경 안써도 될 것 같아 직관적으로 작성한 풀이
// 각 스킬트리를 체크한다
// 선행 스킬일 경우 선행여부를 따진다
// - 가장 최근 저장된 index 값보다(초기값 = 시작 인덱스값) 현재 스킬의 인덱스 값이 작으면 순서 오류, 다음 스킬트리로 넘어간다
// - 크거나 같다면 index 값을 갱신한다
// 선행 관계가 맞는 스킬트리에 대하여 빠진 단계가 없는지 체크한다
// - 스킬트리중 선행스킬들만 담고있는 tmp문자열과 선행스킬 문자열을 해당 길이까지 비교한다
// 맞는 스킬트리면 result를 1 증가하고 다음 스킬트리를 확인한다

import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    var result = 0
    
    for i in 0..<skill_trees.count {
        var isSkillTree = true
        var index = skill.startIndex
        var tmp = ""
        for s in skill_trees[i] {
            if skill.contains(s) {
                if skill.firstIndex(of: s)! < index {
                    isSkillTree = false
                    break
                } else {
                    index = skill.firstIndex(of: s)!
                    tmp.append(s)
                }
            }
        }
        
        for j in 0..<tmp.count {
            if tmp[tmp.index(tmp.startIndex, offsetBy: j)] != skill[skill.index(skill.startIndex, offsetBy: j)]{
                isSkillTree = false
            }
        }
        
        result += isSkillTree ? 1 : 0
    }
    return result
}
