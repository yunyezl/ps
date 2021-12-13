import Foundation

let t = Int(readLine()!)!

for _ in 0..<t {
    _ = Int(readLine()!)!
    var prices = readLine()!.split(separator: " ").map { Int(String($0))! }

    var buyPrices = 0
    var count = 0
    var sellPrices = 0

    while !prices.isEmpty {
        let lastMaxIndex = prices.lastIndex(of: prices.max()!)!
        
        if lastMaxIndex != 0 {
            buyPrices += prices[0...lastMaxIndex - 1].reduce(0, +)
            count = prices[0...lastMaxIndex - 1].count
            sellPrices += count * prices[lastMaxIndex]
        }
        
        if lastMaxIndex + 1 <= prices.count - 1 {
            prices = Array(prices[lastMaxIndex + 1...prices.count-1])
        } else {
            break
        }
    }

    print(sellPrices - buyPrices)
}
