let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0]
let m = input[1]

func backtracking(_ cnt: Int, _ string: String) {
    if cnt == m {
        print(string)
        return
    }
    
    for i in 1...n {
        backtracking(cnt + 1, string + "\(i) ")
    }
}

backtracking(0, "")
