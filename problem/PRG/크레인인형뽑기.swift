import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var board = board
    var baket: [Int] = []
    
    var answer = 0
    for move in moves {
        for i in 0..<board.count {
            if board[i][move-1] != 0 {
                if baket.count != 0 && baket.last! == board[i][move-1] {
                    baket.popLast()
                    answer += 2
                } else {
                    baket.append(board[i][move-1])
                }
                board[i][move-1] = 0
                break
            }
        }
    }
    return answer
}
