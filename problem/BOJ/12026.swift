let n = Int(readLine()!)!
let array = Array(readLine()!).map { String($0) }

var next: [String: String] = [:]
next["B"] = "O"
next["O"] = "J"
next["J"] = "B"

var dp = Array(repeating: -1, count: array.count)
dp[0] = 0
for i in 0..<n {
    if dp[i] == -1 {
        continue
    }
    let next = next[array[i]]
    for j in i+1..<n {
        if next != array[j] { continue }
        if dp[j] == -1 {
            dp[j] = dp[i] + (j - i) * (j - i);
        }
        dp[j] = min(dp[i] + (j - i) * (j - i), dp[j])
    }
}

print(dp[n-1])
