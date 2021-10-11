import Foundation

var n = Int(readLine()!)!
var cowInfo: [Int: Int] = [:]
var answer = 0

for _ in 0..<n {
    let input = Array(readLine()!).split(separator: " ").map { Int(String($0))! }
    if cowInfo.keys.contains(input[0]) {
        if cowInfo[input[0]] != input[1] {
            cowInfo[input[0]] = input[1]
            answer += 1
        }
    } else {
        cowInfo[input[0]] = input[1]
    }
}

print(answer)

