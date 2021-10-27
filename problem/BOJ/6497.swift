import Foundation

class  FileIO {
    private var buffer:[UInt8]
    private var index: Int

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
        index = 0
    }

    @inline(__always)  private func read() -> UInt8 {
        defer { index += 1 }

        return buffer.withUnsafeBufferPointer { $0[index] }
    }

    @inline(__always)  func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10 || now == 32 { // 공백과 줄바꿈 무시
            now = read()
        }
        
        if now == 45{ // 음수 처리
            isPositive.toggle()
            now = read()
        }
        
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }
}


func find_parent(_ x: Int, _ parent: inout [Int]) -> Int {
    if parent[x] != x {
        parent[x] = find_parent(parent[x], &parent)
    }
    return parent[x]
}

func union_find(_ a: Int, _ b: Int, _ parent: inout [Int]) {
    let a = find_parent(a, &parent)
    let b = find_parent(b, &parent)
    
    if a < b {
        parent[b] = a
    } else {
        parent[a] = b
    }
}
 
let file = FileIO()
while true {
    let input = [file.readInt(), file.readInt()]

    let n = input[0] // 집의 수 n
    let m = input[1] // 길의 수 m
    
    if m == 0 && n == 0 {
        break
    }
    
    var edges: [(Int, Int, Int)] = []
    var parent = Array(repeating: 0, count: n + 1)
    for i in 1..<n+1 {
        parent[i] = i
    }
    
    for _ in 0..<m {
        let input = [file.readInt(),file.readInt(),file.readInt()]
        edges.append((input[2], input[0], input[1]))
    }
    
    edges.sort {
        $0.0 < $1.0
    }
    
    var result = 0
    for edge in edges {
        var (cost, a, b) = edge
        if find_parent(a, &parent) != find_parent(b, &parent) {
            union_find(a, b, &parent)
        } else {
            result += cost
        }
    }
    
    print(result)
}
