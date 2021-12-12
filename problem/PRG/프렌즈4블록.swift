func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    var boardArray: [[String]] = []
    
    for b in board {
        boardArray.append(b.map { String($0) })
    }
    
    var popBlock: [(Int, Int)] = []
    
    func check(_ nowY: Int, _ nowX: Int, _ block: String) -> Bool {
        if nowY == m - 1 || nowX == n - 1 || block == "" {
            return false
        }
        
        if boardArray[nowY][nowX+1] == block &&
            boardArray[nowY+1][nowX] == block &&
             boardArray[nowY+1][nowX+1] == block {
            for (ny, nx) in [(nowY, nowX), (nowY, nowX+1), (nowY+1, nowX), (nowY+1, nowX+1)] {
                if !popBlock.contains(where: { (y, x) in
                    return ny == y && nx == x
                }) {
                    popBlock.append((ny, nx))
                }
            }
            return true
        }
        
        return false
    }
    
    func moveBlock() {
        for i in 0..<n {
            for j in stride(from: m-1, to: -1, by: -1) {
                for k in stride(from: m-1, to: j, by: -1) where boardArray[j][i] != "" && boardArray[k][i] == "" {
                    boardArray[k][i] = boardArray[j][i]
                    boardArray[j][i] = ""
                    break
                }
            }
        }
    }
    
    var count = 0
    
    while true {
        popBlock = []
        
        for i in 0..<m {
            for j in 0..<n {
                check(i, j, boardArray[i][j])
            }
        }
        
        if popBlock.isEmpty {
            break
        }

        count += popBlock.count
        
        for (x, y) in popBlock {
            boardArray[x][y] = ""
        }
        
        moveBlock()
    }
  
    return count
}
