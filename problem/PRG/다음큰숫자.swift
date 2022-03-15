import Foundation

func solution(_ n:Int) -> Int
{
    var n = n
    let count = Array(String(n, radix: 2)).map { String($0) }.filter({ $0 == "1" }).count
    
    while true {
        n += 1
        let bigger = Array(String(n, radix: 2)).map { String($0) }.filter({ $0 == "1" }).count
        if count == bigger {
            break
        }
    }
    
    return n
}
