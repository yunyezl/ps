import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])

let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

var board: [[Int]] = []
var cctvs: [(Int, Int)] = []
var ans = 0
var visited = Array(repeating: Array(repeating: false, count: m), count: n)

for i in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    board.append(input)
    for j in 0..<m {
        if board[i][j] >= 1 && board[i][j] <= 5 {
            cctvs.append((i, j))
            visited[i][j] = true
        } else if board[i][j] == 0 {
            ans += 1
        }
    }
}

print(dfs(cnt: 0))

func dfs(cnt: Int) -> Int {
    if cnt == cctvs.count {
        var tmp = 0
        for i in 0..<n {
            for j in 0..<m {
                if board[i][j] == 0 && !visited[i][j] {
                    tmp += 1
                }
            }
        }
        return tmp
    }
    // CCTV 위치 가져오기
    let (x, y) = (cctvs[cnt].0, cctvs[cnt].1)
    for k in 0..<4 { // CCTV 총 4방향 회전
        var newDir: [Int] = []
        // CCTV 별 확인해야하는 방향 넣어주기
        if board[x][y] == 1 {
            newDir.append(k)
        } else if board[x][y] == 2 {
            newDir.append(k)
            newDir.append((k + 2) % 4)
        } else if board[x][y] == 3 {
            newDir.append(k)
            newDir.append((k - 1 < 0 ? 3 : k - 1) % 4)
        } else if board[x][y] == 4 {
            newDir.append(k)
            newDir.append((k - 1 < 0 ? 3 : k - 1) % 4)
            newDir.append((k + 2) % 4)
        } else if board[x][y] == 5 {
            newDir.append(k)
            newDir.append((k - 1 < 0 ? 3 : k - 1) % 4)
            newDir.append((k + 1) % 4)
            newDir.append((k + 2) % 4)
        }
        var q: [(Int, Int)] = []
        for d in newDir { // CCTV 방향 개수만큼 이동
            var (nx, ny) = (x + dx[abs(d)], y + dy[abs(d)])
            while nx >= 0 && nx < n && ny >= 0 && ny < m  {
                if !visited[nx][ny] && board[nx][ny] != 6 {
                    visited[nx][ny] = true
                    q.append((nx, ny))
                } else if board[nx][ny] == 6 {
                    break
                }
                nx += dx[d]
                ny += dy[d]
            }
        }
        ans = min(ans, dfs(cnt: cnt + 1))
        var left = 0
        while left < q.count {
            let (qx, qy) = q[left]
            if board[qx][qy] == 0 {
                visited[qx][qy] = false
            }
            left += 1
        }
        if board[x][y] == 5 { break }
    }
    return ans
}
