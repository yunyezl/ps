import Foundation

var direction = 0
let dy = [1, 0, -1, 0]
let dx = [0, 1, 0, -1]

func turnLeft() {
    direction -= 1
    if direction < 0 {
        direction = 3
    }
}

func turnRight() {
    direction += 1
    if direction > 3 {
        direction = 0
    }
}

var t = Int(readLine()!)!

for _ in 0..<t {
    let commandList = Array(readLine()!).map { String($0) }
    var path: [(Int, Int)] = [(0, 0)]
    var y = 0
    var x = 0
    for command in commandList {
        if command == "F" {
            y += dy[direction]
            x += dx[direction]
            path.append((y, x))
        } else if command == "B" {
            y -= dy[direction]
            x -= dx[direction]
            path.append((y, x))
        } else if command == "L" {
            turnLeft()
        } else {
            turnRight()
        }
    }
    
    let yList = path.map { $0.0 }
    let xList = path.map { $0.1 }
    
    let answer = (yList.max()! - yList.min()!) * (xList.max()! - xList.min()!)
    print(answer)
}
