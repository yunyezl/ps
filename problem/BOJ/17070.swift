let n = Int(readLine()!)!
var board: [[Int]] = []

for _ in 0..<n {
    board.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

func solution() {
    var dp = Array(repeating: Array(repeating: Array(repeating: 0, count: 3), count: n), count: n)

    dp[0][1][0] = 1
    
    for i in 0..<n {
        for j in 2..<n where board[i][j] != 1 {
            // 가로 방향의 파이프의 끝이 (i, j) 인 경우의 수
            dp[i][j][0] = dp[i][j-1][0] + dp[i][j-1][2]
            
            // 맨 윗 줄일 경우 더 이상 안함(세로, 대각선에서 올 수 없으므로
            if i == 0 { continue }
            
            // 세로 방향 파이프의 끝이 (i, j)인 경우의 수
            dp[i][j][1] = dp[i-1][j][1] + dp[i-1][j][2]
            
            // (i, j) 기준 왼쪽, 위쪽이 막혀있으면 올 수 없음
            if board[i-1][j] == 1 || board[i][j-1] == 1 { continue }
            
            // 대각선 방향의 파이프의 끝이 (i, j) 인 경우의 수
            dp[i][j][2] = dp[i-1][j-1][0] + dp[i-1][j-1][1] + dp[i-1][j-1][2]
        }
    }
    print(dp[n-1][n-1].reduce(0, +))
}

solution()
