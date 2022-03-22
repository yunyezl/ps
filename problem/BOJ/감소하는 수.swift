
let n = Int(readLine()!)!

func bfs() -> Int {
    var queue = (1..<10).map { $0 }
    var left = 0
    var count = 0
    while left < queue.count {
        let t1 = queue[left]
        count += 1
        if count == n {
            return t1
        }
        let last = Int(String(String(t1).last!))!
        for i in 0..<last {
            queue.append(Int(String(t1) + String(i))!)
        }
        print(queue)
        left += 1
    }
    return -1
}

if n == 0 {
    print(0)
} else {
    print(bfs())
}
