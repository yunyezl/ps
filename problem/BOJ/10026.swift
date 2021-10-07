import Foundation

func dfs(_ x: Int, _ y: Int, _ isBlind: Bool, _ board: inout [[Character]], _ color: Character) {
    if  x < 0 || x >= n || y < 0 || y >= n {
        return
    }
    
    if isBlind {
        if color == "B" {
            if board[x][y] == "R" || board[x][y] == "G" {
                return
            }
        } else {
            if board[x][y] == "B" {
                return
            }
        }
    } else {
        if board[x][y] != color {
            return
        }
    }

    if board[x][y] != "V" {
        board[x][y] = "V"
        dfs(x + 1, y, isBlind, &board, color)
        dfs(x - 1, y, isBlind, &board, color)
        dfs(x, y + 1, isBlind, &board, color)
        dfs(x, y - 1, isBlind, &board, color)
        return
    }
    
    return
}

let n = Int(readLine()!)!
var board: [[Character]] = []
for _ in 0..<n {
    board.append(Array(readLine()!))
}
var board2 = board
var blindResult: Int = 0
var basicResult: Int = 0

for i in 0..<n {
    for j in 0..<n {
        if board[i][j] != "V" {
            dfs(i, j, true, &board, board[i][j])
            blindResult += 1
        }
        if board2[i][j] != "V" {
            dfs(i, j, false, &board2, board2[i][j])
            basicResult += 1
        }
    }
}

print(basicResult, blindResult)

