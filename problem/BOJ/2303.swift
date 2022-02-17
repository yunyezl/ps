import Foundation

func dfs(index: Int, count: Int, cards: inout [Int], visited: inout [Bool]) {
    if count == 3 {
        var sum = 0
        for card in cards {
            sum += card
        }
        let lastValue = Array(String(sum)).map { Int(String($0))! }.last!
        if lastValue > max {
            max = lastValue
        }
        return
    }
    
    for i in index..<5 {
        if !visited[i] {
            visited[i] = true
            cards.append(allCard[i])
            dfs(index: index + 1, count: count + 1, cards: &cards, visited: &visited)
            cards.popLast()
            visited[i] = false
        }
    }
}

let n = Int(readLine()!)!
var allCard: [Int] = []
var max = 0
var answers: [Int] = []

for i in 0..<n {
    var visited = Array(repeating: false, count: 5)
    var cards: [Int] = []
    allCard = Array(readLine()!).split(separator: " ").map { Int(String($0))! }
    max = 0
    dfs(index: 0, count: 0, cards: &cards, visited: &visited)
    answers.append(max)
}

max = answers.max()!
print(answers.enumerated().filter({ $1 == max }).max(by: { $0.offset < $1.offset })!.offset + 1)
