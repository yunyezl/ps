
import Foundation

func manhattanDistance(t1: (r1: Int, c1: Int), t2: (r2: Int, c2: Int)) -> Int {
    // 두 테이블 T1, T2가 행렬 (r1, c1), (r2, c2)에 각각 위치하고 있다면, T1, T2 사이의 맨해튼 거리는 |r1 - r2| + |c1 - c2| 입니다.
    return abs(t1.r1 - t2.r2) + abs(t1.c1 - t2.c2)
}

func check(place: [[String]],
         visited: inout [[Bool]],
         queue: inout [(Int, Int)]) -> Bool {
    var head = 0
    let dy: [Int] = [0, 1, 0, -1, -1, -1, 1, 1, 2, -2, 0, 0]
    let dx: [Int] = [1, 0, -1, 0, -1, 1, -1, 1, 0, 0, 2, -2]
    
    while head < queue.count {
        let (y, x) = queue[head]
        for i in 0..<dy.count {
            let ny = y + dy[i]
            let nx = x + dx[i]
            if nx > -1 &&
                ny > -1 &&
                nx < 5 &&
                ny < 5 &&
                place[ny][nx] == "P" &&
                manhattanDistance(t1: (y, x), t2: (ny, nx)) <= 2 {
                if y != ny && x != nx { // 대각선에 있는 경우
                    if x > nx {
                        if y > ny {
                            if place[y][x-1] != "X" || place[y-1][x] != "X" {
                                return false
                            }
                        } else {
                            if place[y+1][x] != "X" || place[y][x-1] != "X" {
                                return false
                            }
                        }
                    } else {
                        if y > ny {
                            if place[y][x+1] != "X" || place[y-1][x] != "X" {
                                return false
                            }
                        } else {
                            if place[y][x+1] != "X" || place[y+1][x] != "X" {
                                return false
                            }
                        }
                    }
                } else {  // 일직선 상에 있는 경우
                    if nx > x {
                        if place[y][x + 1] != "X" {
                            return false
                        }
                    } else if nx < x {
                        if place[y][x - 1] != "X" {
                            return false
                        }
                    } else if ny > y {
                        if place[y + 1][x] != "X" {
                            return false
                        }
                    } else if ny < y {
                        if place[y - 1][x] != "X" {
                            return false
                        }
                    }
                }
            }
        }
        head += 1
    }
    
    return true
}

func solution(_ places:[[String]]) -> [Int] {
    let places = places.map { $0.map { Array($0).map { String($0) } } }
    var answer: [Int] = []
    for place in places {
        var visited = Array(repeating: Array(repeating: false, count: 5), count: 5)
        var queue: [(Int, Int)] = []
        // 큐에 앉아있는 사람들 넣어두기
        for j in 0..<5 {
            for i in 0..<5 {
                if place[j][i] == "P" {
                    queue.append((j, i))
                }
            }
        }
        if !check(place: place, visited: &visited, queue: &queue) {
            answer.append(0)
        } else {
            answer.append(1)
        }
    }
    
    return answer
}
