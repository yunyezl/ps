import Foundation

func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    var matrix = [[Int]]()
    var ans = [Int]()
    for r in 0..<rows {
        matrix.append(Array(r*columns + 1...r*columns + columns))
    }

    for q in queries {
        let minY = q[0] - 1
        let minX = q[1] - 1
        let maxY = q[2] - 1
        let maxX = q[3] - 1
        let tmp = matrix[minY][minX]
        var minimum = tmp
        
        for y in minY..<maxY {
            minimum = min(matrix[y+1][minX], minimum)
            matrix[y][minX] = matrix[y+1][minX]
        }
        
        for x in minX..<maxX {
            minimum = min(matrix[maxY][x+1], minimum)
            matrix[maxY][x] = matrix[maxY][x+1]
        }
        
        for y in (minY+1...maxY).reversed() {
            minimum = min(minimum, matrix[y-1][maxX])
            matrix[y][maxX] = matrix[y-1][maxX]
        }
    
        for x in (minX+1...maxX).reversed() {
            minimum = min(minimum, matrix[minY][x-1])
            matrix[minY][x] = matrix[minY][x-1]
        }

        matrix[minY][minX+1] = tmp
        ans.append(minimum)
    }

    return ans
}
