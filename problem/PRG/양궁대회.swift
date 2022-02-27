import Foundation

// 0부터 9까지 어피치보다 한 발 더 쏘는 경우 완전 탐색

func diff(info: [Int], myshots: [Int]) -> Int {
    var enemyScore = 0
    var myScore = 0
    for i in 0..<11 {
        if (info[i], myshots[i]) == (0, 0) {
            continue
        }
        if info[i] >= myshots[i] {
            enemyScore += (10 - i)
        } else {
            myScore += (10 - i)
        }
    }
    return myScore - enemyScore
}

func dfs(_ info: [Int],
         _ myshots: inout [Int],
         _ remainShots: Int,
         _ target: Int,
         _ max: inout Int,
         _ answers: inout [[Int]]) {
    if target == 11 {
        if remainShots != 0 {
            myshots[10] = remainShots
        }
        let scoreDiff = diff(info: info, myshots: myshots)
        if scoreDiff <= 0 {
            return
        }
        if scoreDiff > max {
            max = scoreDiff
            answers = [myshots]
            return
        }
        if scoreDiff == max {
            answers.append(myshots)
        }
        return
    }


    if info[target] < remainShots {
        myshots.append(info[target] + 1)
        dfs(info, &myshots, remainShots - info[target] - 1, target + 1, &max, &answers)
        myshots.removeLast()
    }

    myshots.append(0)
    dfs(info, &myshots, remainShots, target + 1, &max, &answers)
    myshots.removeLast()
}

func solution(_ n:Int, _ info:[Int]) -> [Int] {
    var max = 0
    var answers: [[Int]] = []
    var myshots: [Int] = []
    dfs(info, &myshots, n, 0, &max, &answers)
    
    if answers == [] {
        return [-1]
    }
    
    answers.sort {
        for i in stride(from: 10, to: 0, by: -1) {
            if $0[i] == $1[i] {
                continue
            }
            return $0[i] > $1[i]
        }
        return $0.last! > $1.last!
    }
    
    return answers.first!
}
