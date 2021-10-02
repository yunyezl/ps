import Foundation

let dx: [Int] = [1, 0, -1, 0]
let dy: [Int] = [0, 1, 0, -1]

func bfs() {
    while left < right {
        let (x, y) = queue[left]
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            if nx > -1 && ny > -1 && nx < n && ny < m && tomatos[nx][ny] == 0 {
                tomatos[nx][ny] = tomatos[x][y] + 1
                queue.append((nx, ny))
                right += 1
            }
        }
        left += 1
    }
}

let input = Array(readLine()!).split(separator: " ").map { Int(String($0))! }
let m = input[0]
let n = input[1]
var tomatos: [[Int]] = Array(repeating: [], count: n)
var queue: [(Int, Int)] = []

for i in 0..<n {
    tomatos[i] = Array(readLine()!).split(separator: " ").map{ Int(String($0))! }
}

/// 토마토의 위치 넣기
for i in 0..<n {
    for j in 0..<m {
        if tomatos[i][j] == 1 {
            queue.append((i, j))
        }
    }
}

var left = 0
var right = queue.count

bfs()

var maxValue = 0

func findDay() -> Int {
    let flatTomatos = tomatos.flatMap{ $0 }
    let maxValue = flatTomatos.max() ?? 1
    
    if flatTomatos.contains(0) {
        return -1
    } else if maxValue == 1 {
        return 0
    } else {
        return maxValue - 1
    }
}

print(findDay())
