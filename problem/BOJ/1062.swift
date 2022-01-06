import Foundation


let value = readLine()!.split(separator: " ").map { Int($0)! }
let n = value[0], k = value[1]

var bit = 0
bit = bit | 1 << (Character("a").asciiValue! - 97)
bit = bit | 1 << (Character("c").asciiValue! - 97)
bit = bit | 1 << (Character("i").asciiValue! - 97)
bit = bit | 1 << (Character("n").asciiValue! - 97)
let origin = bit | 1 << (Character("t").asciiValue! - 97)
print(String(origin, radix: 2).count)

var maxCount = 0
var numbers: [Int] = []

(0..<n).forEach { _ in
    var bit = origin
    let input = readLine()!
    let value = input[input.index(input.startIndex, offsetBy: 4)..<input.index(input.endIndex, offsetBy: -4)].map { String($0) }
    print(value)
    for ch in value {
        bit = bit | 1 << (Character(ch).asciiValue! - 97)
    }
    numbers.append(bit)
}

func combination(count: Int, index: Int, bit: Int) {
    if count == k {
        var count = 0
        for number in numbers {
            if number == (bit & number) {
                print(String(bit, radix: 2))
                count += 1
            }
        }
        maxCount = count > maxCount ? count : maxCount
        return
    } else {
        for i in index..<26 {
            if (bit & (1 << i)) == (1 << i) {
                continue
            }
            combination(count: count+1, index: i+1, bit: bit | 1 << i)
        }
    }
}

if k < 5 {
    print(maxCount)
} else {
    combination(count: 5, index: 0, bit: origin)
    print(maxCount)
}
