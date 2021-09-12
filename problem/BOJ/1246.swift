let input = Array(readLine()!).split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1]

var prices: [Int] = []
for _ in 0..<m {
    prices.append(Int(readLine()!)!)
}

prices.sort()

var answer = 0, temp = 0
var sell = 0

for i in 0..<m {
    if m - i < n {
        temp = prices[i] * (m - i)
    } else {
        temp = prices[i] * n
    }
    
    if answer < temp {
        sell = prices[i]
        answer = temp
    }
}

print(sell, answer)
