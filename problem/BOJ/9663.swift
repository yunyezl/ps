// 첫 번째 풀이, abs 쓰면 시간 초과나서 조건식 3개로

import Foundation

let n = Int(readLine()!)!
var board = Array(repeating: 0, count: 15)
var count = 0

func isPossible(_ row: Int) -> Bool {
    for i in 0..<row {
          if board[i] == board[row] || board[i] - board[row] == i - row || board[row] - board[i] == i - row {
              return false;
          }
      }
    return true
}

func putChess(_ row: Int) {
    if row == n {
        count += 1
        return
    }
    
    for i in 0..<n {
        /// 일단 체스 두기
        board[row] = i
        if isPossible(row) { /// 대각선, 같은 줄에 아무 것도 없다면 다음 라인으로 넘어가기
            putChess(row + 1)
        } else { /// 놓을 수 없으면 뒀던거 빼기
            board[row] = 0
        }
    }

}

/// 체스의 첫번째 줄에 놓고 재귀 시작
putChess(0)
print(count)



// 두번째 풀이, 행마다 배치해서 대각선만 비교

import Foundation

let n = Int(readLine()!)!
var col = Array(repeating: false, count: 15)
var diagonal = Array(repeating: false, count: 30) /// 대각선에 대한 정보 저장
var reverseDiagonal = Array(repeating: false, count: 30) /// 역대각선에 대한 정보 저장
var count = 0

func queen(x: Int) { // 행 번호, 놓은 퀸의 개수
    if x == n {
        count += 1
        return
    }
    for y in 0..<n {
        // 같은 열에 퀸이 없으면서, 양 대각선에 퀸이 없을 때
        if !col[y] && !diagonal[x+y] && !reverseDiagonal[n-1 + x-y] {
            col[y] = true /// x, y에 퀸을 놓음
            /// 이제 x, y 대각선에는 놓을 수 없으니까 true 처리
            diagonal[x + y] = true
            reverseDiagonal[n-1 + x-y] = true
            queen(x: x + 1)
            col[y] = false
            diagonal[x + y] = false
            reverseDiagonal[n-1 + x-y] = false
        }
    }
    
}

queen(x: 0)
print(count)
