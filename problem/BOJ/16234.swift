// 인구 이동

// 국경선을 공유하는 두 나라의 인구 차이가 L명 이상 R명 이하라면
// 두 나라가 공유하는 국경선을 오늘 하루동안 염.

// 국경선이 모두 열렸으면 인구 이동 시작
// 연합을 이루고 있는 각 칸의 인구수는 (연합의 인구수) / (연합을 이루고 있는 칸의 개수), 소수점은 버림

// 0,0에서 출발해서 인접한 면들과의 차이 계산, L명 이상 R명 이하면 union에 (x, y, 인구수) 넣기

func diff(_ p1: Int, _ p2: Int) -> Int {
    return abs(p1 - p2)
}

func bfs(_ x: Int, _ y: Int, _ population: Int) -> [(Int, Int, Int)] {
    var queue = [(x, y, population)]
    var left = 0
    var uni: [(Int, Int, Int)] = [(x, y, population)]
    visited[x][y] = true
    
    while left < queue.count {
        let (x, y, population) = queue[left]
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            if nx < 0 || ny < 0 || nx >= N || ny >= board[0].count || visited[nx][ny] {
                continue
            }
            let diff = diff(population, board[nx][ny])
            if diff >= L && diff <= R {
                uni.append((nx, ny, board[nx][ny]))
                queue.append((nx, ny, board[nx][ny]))
                visited[nx][ny] = true
            }
        }
        left += 1
    }
    return uni
}


let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, L, R) = (input[0], input[1], input[2])
var board: [[Int]] = []

for _ in 0..<N {
    board.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

let dx = [-1, 0, 1, 0]
let dy = [0, 1, 0, -1]

var visited = Array(repeating: Array(repeating: false, count: board[0].count), count: N)
var day = 0
while true {
    var unions: [[(Int, Int, Int)]] = []
    visited = Array(repeating: Array(repeating: false, count: board[0].count), count: N)
    for i in 0..<N {
        for j in 0..<board[0].count {
            if !visited[i][j] {
                let uni = bfs(i, j, board[i][j])
                if uni.count > 1 {
                    unions.append(uni)
                }
            }
        }
    }
    if unions.isEmpty {
        break
    }
    for union in unions {
        let avg = union.map { $0.2 }.reduce(0, +) / union.count
        union.forEach { x, y, _ in
            board[x][y] = avg
        }
    }
    day += 1
}

print(day)
