func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    var totalOutput = ""
    for i in 0..<m*t {
        totalOutput += String(i, radix: n)
    }
    var answer = ""
    let totalOutputArray = Array(totalOutput).map { String($0) }
    for i in stride(from: p-1, to: totalOutput.count, by: m) {
        if answer.count == t {
            break
        }
        answer += totalOutputArray[i]
    }
    return answer.uppercased()
}
