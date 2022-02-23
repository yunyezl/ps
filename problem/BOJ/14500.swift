// 테트로미노

enum Tetrometno: CaseIterable {
    case straight, square, etc1, etc2, etc3
    
    var initalPosition: [(Int, Int)] {
        switch self {
        case .straight:
            return [(0, 0), (0, 1), (0, 2), (0, 3)]
        case .square:
            return [(0, 0), (0, 1), (1, 0), (1, 1)]
        case .etc1:
            return [(0, 0), (1, 0), (2, 0), (2, 1)]
        case .etc2:
            return [(0, 0), (1, 0), (1, 1), (2, 1)]
        case .etc3:
            return [(0, 0), (0, 1), (0, 2), (1, 1)]
        }
    }
}

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])

func rotateMatrix90(before: [[Int]]) -> [[Int]] {
    let (N, M) = (before[0].count, before.count)
    var after = Array(repeating: Array(repeating: 0, count: M), count: N)

    for i in 0..<M {
        for j in 0..<N {
            after[j][M-i-1] = before[i][j]
        }
    }

    return after
}

func reverseLeftAndRight(before: [[Int]]) -> [[Int]] {
    let (N, M) = (before[0].count, before.count)
    var after = Array(repeating: Array(repeating: 0, count: N), count: M)
    
    for i in 0..<M {
        for j in 0..<N {
            after[i][j] = before[i][N-1-j]
        }
    }
    
    return after
}

var matrix: [[Int]] = []
for _ in 0..<n {
    matrix.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

var allMatrixCase: [[[Int]]] = []
for i in 0..<8 {
    matrix = rotateMatrix90(before: matrix)
    allMatrixCase.append(matrix)
    if i == 3 {
        matrix = reverseLeftAndRight(before: matrix)
    }
}

var maximum = 0
for tetro in Tetrometno.allCases {
    for matrix in allMatrixCase {
        for x in 0..<matrix.count {
            for y in 0..<matrix[0].count {
                var isValidPosition = true
                var sum = 0
                for (nx, ny) in tetro.initalPosition {
                    let np = (nx + x, ny + y)
                    if np.0 < 0
                        || np.0 >= matrix.count
                        || np.1 < 0
                        || np.1 >= matrix[0].count {
                        isValidPosition = false
                        break
                    }
                    sum += matrix[np.0][np.1]
                }
                
                if !isValidPosition { continue }
                if maximum < sum {
                    maximum = sum
                }
            }
        }
    }
}

print(maximum)
