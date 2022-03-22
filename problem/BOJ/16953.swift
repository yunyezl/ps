let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (a, b) = (input[0], input[1])

var numbers = [2, 10]

var queue = [(a, 0)]
var left = 0
var ans = 0
var flag = false

while left < queue.count {
    let (num, count) = queue[left]
    if num == b {
        ans = count + 1
        flag = true
        break
    }
    for i in 0..<2 {
        var tmp = num * numbers[i]
        if i == 1 { tmp += 1 }
        if num < b {
            queue.append((tmp, count + 1))
        }
    }
    left += 1
}

if flag {
    print(ans)
} else {
    print(-1)
}
