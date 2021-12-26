import Foundation

var dp: [[Int]] = []
let n = Int(readLine()!)!

for i in 0..<n {
    dp.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

for i in 1..<n {
    for j in 0..<dp[i].count {
        if j == 0 {
            dp[i][j] = dp[i][j] + dp[i-1][j]
        } else if j == dp[i-1].count {
            dp[i][j] = dp[i][j] + dp[i-1][j-1]
        } else {
            dp[i][j] = dp[i][j] + max(dp[i-1][j-1], dp[i-1][j])
        }
    }
}

print(dp[n-1].max()!)
