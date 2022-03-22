let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m, k) = (input[0], input[1], input[2])

var board = Array(repeating: Array(repeating: 0, count: m), count: n)

for _ in 0..<k {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (i, j) = (input[0], input[1])
    board[i-1][j-1] = 1
}

var dx = [1, 0, -1, 0]
var dy = [0, 1, 0, -1]

func bfs(_ x: Int, _ y: Int) -> Int{
    var queue = [(x, y)]
    var count = 0
    var left = 0
    while left < queue.count {
        let (x, y) = queue[left]
        count += 1
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            if nx < 0 || nx >= n || ny < 0 || ny >= m { continue }
            if board[nx][ny] == 1 {
                queue.append((nx, ny))
                board[nx][ny] = 0
            }
        }
        left += 1
    }
    return count
}

var ans = 0
for i in 0..<n {
    for j in 0..<m {
        if board[i][j] == 1 {
            board[i][j] = 0
            ans = max(bfs(i, j), ans)
        }
    }
}

print(ans)
