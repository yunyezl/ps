func combination(_ target: [(Int, Int)],
                 _ targetNum: Int,
                 _ index: Int,
                 _ tmp: [(Int, Int)]) {
    if tmp.count == targetNum {
        allCase.append(tmp)
        return
    }
    for i in index..<target.count {
        combination(target, targetNum, i + 1, tmp + [target[i]])
    }
}

func distance(_ hx: Int, _ hy: Int, _ cx: Int, _ cy: Int ) -> Int {
    return abs(hx - cx) + abs(hy - cy)
}

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])

var allChickens: [(Int, Int)] = []
var allHouse: [(Int, Int)] = []
var allCase: [[(Int, Int)]] = []

for i in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0)) }
    for j in 0..<input.count {
        if input[j] == 2 {
            allChickens.append((i, j))
        } else if input[j] == 1 {
            allHouse.append((i, j))
        }
    }
}

combination(allChickens, m, 0, [])

var allChickenDistance = Int.max

for chickens in allCase {
    var houses = Array(repeating: Int.max, count: allHouse.count)
    for (cx, cy) in chickens {
        for (idx, (hx, hy)) in allHouse.enumerated() {
            let dist = distance(hx, hy, cx, cy)
            if houses[idx] > dist {
                houses[idx] = dist
            }
        }
    }
    let totalDist = houses.reduce(0, +)
    if totalDist < allChickenDistance {
        allChickenDistance = totalDist
    }
}

print(allChickenDistance)
