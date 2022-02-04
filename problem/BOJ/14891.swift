
import Foundation

func checkLeftGear(number: Int, direction: Int, visited: inout [Bool]) {
    if gears[number][6] != gears[number-1][2] {
        check(number: number-1, direction: -direction, visited: &visited)
    }
}
func checkRightGear(number: Int, direction: Int, visited: inout [Bool]) {
    if gears[number][2] != gears[number+1][6] {
        check(number: number+1, direction: -direction, visited: &visited)
    }
}

func turnClockwise(number: Int) {
    let last = gears[number].last!
    for i in stride(from: 7, to: 0, by: -1) {
        gears[number][i] = gears[number][i-1]
        
    }
    gears[number][0] = last
}

func turnCounterClockwise(number: Int) {
    let first = gears[number].first!
    for i in 0..<7 {
        gears[number][i] = gears[number][i+1]
    }
    gears[number][gears[number].count-1] = first
}

func check(number: Int, direction: Int, visited: inout [Bool]) {
    if !visited[number] {
        visited[number] = true
        if number == 0 {
            checkRightGear(number: number, direction: direction, visited: &visited)
        } else if number == 3 {
            checkLeftGear(number: number, direction: direction, visited: &visited)
        } else {
            checkLeftGear(number: number, direction: direction, visited: &visited)
            checkRightGear(number: number, direction: direction, visited: &visited)
        }
        direction == 1 ? turnClockwise(number: number) : turnCounterClockwise(number: number)
    }
}

var gears: [[Int]] = []

for _ in 0..<4 {
    gears.append(Array(readLine()!).map { Int(String($0))! })
}

let n = Int(readLine()!)!

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let number = input[0]
    let direction = input[1]
    var visited = Array(repeating: false, count: 4)
    check(number: number-1, direction: direction, visited: &visited)
}


var answer = 0
for (index, point) in [1, 2, 4, 8].enumerated() {
    answer += gears[index][0] == 0 ? 0 : point
}

print(answer)
