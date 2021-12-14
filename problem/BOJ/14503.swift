import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])

let info = readLine()!.split(separator: " ").map { Int(String($0))! }
var (r, c, d) = (info[0], info[1], info[2])

let dx = [-1, 0, 1, 0]
let dy = [0, 1, 0, -1]

var board: [[Int]] = []

for _ in 0..<n {
    board.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

func turn_left() {
    d -= 1
    if d < 0 {
        d += 4
    }
}

board[r][c] = 2
var count = 1

while true {
    var turn = false
    // 2. 현재 위치에서 현재 방향을 기준으로 왼쪽 방향부터 차례대로 인접한 칸을 탐색한다.
    for _ in 0..<4 {
        turn_left() // 왼쪽 방향으로 돌기
        let nx = r + dx[d]
        let ny = c + dy[d]
        if nx < 1 || nx >= n || ny < 1 || ny >= m {
            continue
        }
        if board[nx][ny] == 0 {
            count += 1
            board[nx][ny] = 2
            r = nx
            c = ny
            turn = true
            break
        }
    }
    
    if !turn {
        // 네번 다 돌았는데도 이동 못함
        let nx = r - dx[d]
        let ny = c - dy[d]
        if nx >= 0 && nx < n && ny >= 0 && ny < m {
            if board[nx][ny] == 2 {
                r = nx
                c = ny
            } else if board[nx][ny] == 1 {
                break
            }
        } else {
            break
        }
    }
    
}


print(count)
