import Foundation

func isPrime(_ num: Int) -> Bool {
    if num < 2 {
        return false
    }
    
    for i in 2...num/2 where i*i <= num {
        if num % i == 0 { return false }
    }
    return true
}

func dfs(_ first: Int, _ n: Int) {
    if n == 0 {
        print(first)
    }
    
    for i in [1, 3, 7, 9] {
        let tmp = first * 10 + i
        if isPrime(tmp) {
            dfs(tmp, n - 1)
        }
    }
}

let n = Int(readLine()!)!

let primes = [2, 3, 5, 7]
for prime in primes {
    dfs(prime, n - 1)
}
