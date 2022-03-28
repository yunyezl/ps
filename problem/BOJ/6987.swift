
import Foundation

let team1 = [0, 0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 3, 3, 4]
let team2 = [1, 2, 3, 4, 5, 2, 3, 4, 5, 3, 4, 5, 4, 5, 5]

func dfs(round: Int, result: inout [[Int]]) -> Bool {
    if round == 15 { // 모든 경기 다 수행했을 때
        var flag = true
        for score in result {
            if score[0] != 0 || score[1] != 0 || score[2] != 0 {
                flag = false
                break
            }
        }
        return flag
    } else {
        var isPossible = false
        for i in 0..<3 {
            // 두 팀이 경기할 수 없는 경우
            if result[match[round].t1][i] == 0 || result[match[round].t2][2-i] == 0 {
                continue
            }

            // 경기 진행 시키기
            result[match[round].t1][i] -= 1
            result[match[round].t2][2-i] -= 1
            
            isPossible = dfs(round: round + 1, result: &result)
            if isPossible { return true }
            
            result[match[round].t1][i] += 1
            result[match[round].t2][2-i] += 1
        }
        return false
    }
}

var match: [(t1: Int, t2: Int)] = []
for i in 0..<5 {
    for j in i+1...5 {
        match.append((i, j))
    }
}

var answer: [Int] = []
for _ in 0..<4 {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    var result: [[Int]] = []
    for i in stride(from: 0, to: input.count - 1, by: 3) {
        result.append(input[i..<i+3].map { Int(String($0))! })
    }
    dfs(round: 0, result: &result) ? answer.append(1) : answer.append(0)
}

print(answer.map { String($0) }.joined(separator: " "))
