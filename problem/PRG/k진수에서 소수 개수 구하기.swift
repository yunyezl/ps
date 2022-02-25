import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
    let numList = String(n, radix: k)
        .split(separator: "0")
        .filter({ $0 != "1" })
        .map { Int(String($0))! }
    
    var count = 0
    for num in numList {
        if isPrimeNumber(num) { count += 1 }
    }
    
    return count
}


func isPrimeNumber(_ num: Int) -> Bool {
    if num == 1  { return false }
    if num == 2 || num == 3 { return true }
    let sq = Int(sqrt(Double(num)))
    for i in 2...sq {
        if num % i == 0 { return false }
    }
    return true
}

print(solution(437674, 3))
