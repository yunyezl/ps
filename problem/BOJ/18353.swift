let n = Int(readLine()!)!
var array = Array(readLine()!).split(separator: " ").map { Int(String($0))! }
array.reverse()

var dp: [Int] = Array(repeating: 1, count: n)

for i in 1..<n {
    for j in 0..<i {
        if array[j] < array[i] {
            dp[i] = max(dp[i], dp[j] + 1)
        }
    }
}

print(n - dp.max()!)
