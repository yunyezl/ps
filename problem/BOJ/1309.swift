import Foundation
/*
사자가 n번째 라인에 있을 때 -> 사자가 없는 경우 / 왼쪽에 있는 경우 / 오른쪽에 있는 경우 세 가지로 분류
사자가 없는 경우에는 전에 아무거나 와도 상관없고(없어도, 왼쪽에 있어도, 오른쪽에 있어도 됨), 사자가 왼쪽에 있는 경우는 없거나 오른쪽에 있어야되고, 사자가 오른쪽에 있는 경우도 반대로 마찬가지
dp[n][0] -> 사자가 n번째 줄에 있고, 사자가 없는 경우 = dp[n-1][0] + dp[n-1][1] + dp[n-1][2]
dp[n][1] -> 사자가 n번째 줄에 있고, 사자가 왼쪽에 있는 경우 dp[n-1][0] + dp[n-1][2]
dp[n][2] -> 사자가 n번째 줄에 있고, 사자가 오른쪽에 있는 경우 dp[n-1][0] + dp[n-1][1]
 */
let n = Int(readLine()!)!
let mod = 9901
var dp = Array(repeating: Array(repeating: 0, count: 3), count: n + 1)

dp[1][0] = 1; dp[1][1] = 1; dp[1][2] = 1;

for i in 2..<n+1 {
    dp[i][0] = (dp[i-1][0] + dp[i-1][1] + dp[i-1][2]) % mod
    dp[i][1] = (dp[i-1][0] + dp[i-1][2]) % mod
    dp[i][2] = (dp[i-1][0] + dp[i-1][1]) % mod
}

print(dp[n].reduce(0, +) % mod)
