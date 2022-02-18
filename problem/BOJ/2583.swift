import Foundation

let dx = [-1, 0, 1, 0]
let dy = [0, 1, 0, -1]

func dfs(_ x: Int, _ y: Int){
    visited[x][y] = true
    answer += 1
    for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        if nx >= n || nx < 0 || ny >= m || ny < 0  {
            continue
        }
        if array[nx][ny] == 0 && !visited[nx][ny] {
            dfs(nx, ny)
        }
    }
}

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m, k) = (input[0], input[1], input[2])

var array = Array(repeating: Array(repeating: 0, count: m), count: n)
var visited = Array(repeating: Array(repeating: false, count: m), count: n)

for _ in 0..<k {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    for j in input[1]..<input[3] {
        for i in input[0]..<input[0]+input[2]-input[0] {
            array[j][i] = 1
        }
    }
}

var answer = 0
var answers: [Int] = []

for i in 0..<n {
    for j in 0..<m {
        if array[i][j] == 0 && !visited[i][j] {
            answer = 0
            dfs(i, j)
            answers.append(answer)
        }
    }
}

print(answers.count)
print(answers.sorted().map { String($0) }.joined(separator: " "))
