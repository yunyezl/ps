let zero = [[1,1,1],[1,0,1],[1,0,1],[1,0,1],[1,1,1]]
let two = [[1,1,1],[0,0,1],[1,1,1],[1,0,0],[1,1,1]]
let three = [[1,1,1],[0,0,1],[1,1,1],[0,0,1],[1,1,1]]
let four = [[1,0,1],[1,0,1],[1,1,1],[0,0,1],[0,0,1]]
let five = [[1,1,1],[1,0,0],[1,1,1],[0,0,1],[1,1,1]]
let six = [[1,1,1],[1,0,0],[1,1,1],[1,0,1],[1,1,1]]
let seven = [[1,1,1],[0,0,1],[0,0,1],[0,0,1],[0,0,1]]
let eight = [[1,1,1],[1,0,1],[1,1,1],[1,0,1],[1,1,1]]
let nine = [[1,1,1],[1,0,1],[1,1,1],[0,0,1],[1,1,1]]

let n = Int(readLine()!)!
let str = Array(readLine()!).map { String($0) }
var array: [[Int]] = []
var size = str.count / 5
var row = 0
for i in 0..<5 {
    var tmp: [Int] = []
    for j in str[row..<row+size] {
        tmp.append(j == "#" ? 1 : 0)
    }
    row += size
    array.append(tmp)
}

func checkNumber(_ col: Int) -> Bool {
    for i in 0..<5 {
        if array[i][col] == 1 {
            return true
        }
    }
    return false
}

func number(_ col: Int) -> String {
    if col == size - 1 || !checkNumber(col + 1) {
        return "1"
    }
    
    var num = Array(repeating: Array(repeating: 0, count: 3), count: 5)
    for x in 0..<5 {
        for y in 0..<3 {
            num[x][y] = array[x][col+y]
        }
    }
    
    if num == zero { return "0" }
    else if num == two { return "2" }
    else if num == three { return "3" }
    else if num == four { return "4" }
    else if num == five { return "5" }
    else if num == six { return "6" }
    else if num == seven { return "7" }
    else if num == eight { return "8" }
    else { return "9" }
}

var result: [String] = []
var col = 0 // 숫자가 시작하는 인덱스
while col < size {
    if checkNumber(col) {
        let num = number(col)
        result.append(num)
        if num == "1" {
            col += 2
        } else {
            col += 4
        }
    } else {
        col += 1
    }
}

print(result.joined(separator: ""))
