

import Foundation

var field: [[String]] = []

for i in 0..<12 {
    field.append(Array(readLine()!).map { String($0) })
}


var flag: Bool = false
let dx: [Int] = [1, 0, -1, 0]
let dy: [Int] = [0, 1, 0, -1]
var count = 0
while true {
    var visited = Array(repeating: Array(repeating: false, count: 6), count: 12)
    var flag = false
    for i in 0..<12 {
        for j in 0..<6 {
            if field[i][j] != "." {
                if bfs(i, j, &visited) {
                    flag = true
                }
            }
        }
    }
    
    if !flag {
        break
    } else {
        popPuyo()
        count += 1
    }
}

print(count)


func bfs(_ x: Int, _ y: Int, _ visited: inout [[Bool]]) -> Bool {
    var head = 0
    var queue = [(x, y)]
    var same = [(x, y)]
    visited[x][y] = true
    let color = field[x][y]
    var count = 1
    while head < queue.count {
        let (x, y) = queue[head]
        head += 1
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            if nx < 0 || ny < 0 || nx >= 12 || ny >= 6 {
                continue
            }
            if !visited[nx][ny] && field[nx][ny] == color {
                count += 1
                queue.append((nx, ny))
                same.append((nx, ny))
                visited[nx][ny] = true
            }
        }
    }

    if count >= 4 {
        for (x, y) in same {
            field[x][y] = "."
        }
        return true
    }

    return false

}

func popPuyo() {
    for i in 0..<6 {
        for j in stride(from: 11, to: -1, by: -1) {
            for k in stride(from: 11, to: j, by: -1) {
                if field[j][i] != "." && field[k][i] == "." {
                    field[k][i] = field[j][i]
                    field[j][i] = "."
                    break
                }
            }
        }
    }
}

