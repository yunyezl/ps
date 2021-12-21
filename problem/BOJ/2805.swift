import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])

var trees = readLine()!.split(separator: " ").map { Int(String($0))! }
trees.sort()

var start = 0
var end = trees.max()!

var result = 0
while start <= end {
    
    let mid = (start + end) / 2
    var total = 0
    
    for t in trees {
        if t - mid > 0 {
            total += t - mid
        }
    }
    
    if total >= m { // 나무의 양이 충분한 경우
        result = mid
        start = mid + 1
    } else {
        end = mid - 1
    }
}

print(result)
