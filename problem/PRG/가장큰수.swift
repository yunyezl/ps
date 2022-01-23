func solution(_ numbers:[Int]) -> String {
    let sortedNumbers = numbers.sorted {
        Int("\($0)\($1)")! > Int("\($1)\($0)")!
    }
    
    let answer = sortedNumbers.map { String($0) }.joined(separator: "")
    if let num = Int(answer) {
        return String(num)
    }
    
    return answer
}
