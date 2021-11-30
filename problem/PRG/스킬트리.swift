
import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {

    var skill = skill.map { String($0) }
    var precedingSkills: [String:[String]] = [:]

    for i in 0..<skill.count {
        precedingSkills[skill[i]] = Array(skill[0..<i])
    }

    var count = 0
    for tree in skill_trees {
        var learnedSkills: [String] = []
        var isOk: Bool = true
        for s in tree {
            let s = String(s)
            if precedingSkills.keys.contains(s) {
                if !Set(precedingSkills[s]!).isSubset(of: Set(learnedSkills)) {
                    isOk = false
                    break
                } else {
                    learnedSkills.append(s)
                }
            }
        }
        if isOk {
            count += 1
        }
    }

    return count
}
