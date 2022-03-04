let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, M) = (input[0], input[1])
var (s, e) = (0, 0)
let array = readLine()!.split(separator: " ").map { Int(String($0))! }

var result = 0
var sum = 0
while true {
    if sum >= M {
        sum -= array[s]
        s += 1
    } else if e == N {
        break
    } else {
        sum += array[e]
        e += 1
    }
    
    if sum == M {
        result += 1
    }
}

print(result)
