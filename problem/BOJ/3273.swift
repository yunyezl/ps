let n = Int(readLine()!)!
var array = readLine()!.split(separator: " ").map { Int(String($0))! }
let x = Int(readLine()!)!

var (s, e) = (0, n - 1)
var result = 0
array.sort()

while true {
    if s >= e { break }
    let tmp = array[s] + array[e]
    if tmp < x {
        s += 1
    } else {
        e -= 1
    }
    
    if tmp == x {
        result += 1
        s += 1
    }
}

print(result)
