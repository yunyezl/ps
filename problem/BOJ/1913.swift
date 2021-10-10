import Foundation

var n = Int(readLine()!)!
var target = Int(readLine()!)!

let dy = [1, 0, -1, 0]
let dx = [0, 1, 0, -1]

var board = Array(repeating: Array(repeating: 0, count: n), count: n)

var y = 0
var x = 0
var value = n * n
var index = 0
var targetY = 0
var targetX = 0
var originalN = n

while true {
            
    for _ in 0..<n - 1 {
        board[y][x] = value
        if board[y][x] == target {
            targetY = y
            targetX = x
        }
        y += dy[index]
        x += dx[index]
        value -= 1
    }

    index += 1
    
    if index % 4 == 0 { // 한 바퀴 뺑 다 돌았을 때
        x += 1
        y += 1
        n -= 2
        index = 0
    }
    
    if n == 1 {
        board[originalN / 2][originalN / 2] = 1
        break
    }
    
}

for i in 0..<originalN {
    print(board[i].map { String($0) }.joined(separator: " "))
}

if target != 1 {
    print(targetY + 1, targetX + 1)
} else {
    print(originalN/2 + 1 , originalN/2 + 1)
}

