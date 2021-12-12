import Foundation

let n = Int(readLine()!)!
var peoples = readLine()!.split(separator: " ").map { Int(String($0))! }

var accumulated = 0
peoples.sort()

for i in 0..<n {
    accumulated += peoples[0...i].reduce(0, +)
}

print(accumulated)
