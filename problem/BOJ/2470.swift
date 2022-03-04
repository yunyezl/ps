let n = Int(readLine()!)!
var array = readLine()!.split(separator: " ").map { Int(String($0))! }
array.sort()

var (s, e) = (0, array.count - 1)
var minDiff = Int.max

func search(_ start: Int, _ end: Int) {
    if start >= end { return }
    let tmp = array[start] + array[end]
    if abs(tmp) < minDiff {
        s = start
        e = end
        minDiff = abs(tmp)
    }
    
    if abs(array[start]) > abs(array[end]) {
        search(start + 1, end)
    } else {
        search(start, end - 1)
    }
}

search(s, e)
var answer = ""
for i in [array[s], array[e]] {
    answer += String(i) + " "
}

print(answer)
