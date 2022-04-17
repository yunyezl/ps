import Foundation

// 시간 초과 풀이
// func solution(_ n:Int, _ k:Int, _ cmd:[String]) -> String {
//     var table = Array(repeating: -1, count: n)
//     for i in 0..<n {
//         table[i] = i
//     }

//     let initState = table
//     var pointer = k
//     var backingStore: [(index: Int, id: Int)] = []
//     for c in cmd {
//         let c = c.split(separator: " ")
//         if c[0] == "U" {
//             pointer -= Int(c[1])!
//             if pointer < 0 {
//                 pointer = 0
//             }
//         } else if c[0] == "D" {
//             pointer += Int(c[1])!
//             if pointer >= table.count {
//                 pointer = table.count - 1
//             }
//         } else if c[0] == "C" {
//             backingStore.append((pointer, table[pointer]))
//             table.remove(at: pointer)
//             if pointer == table.count {
//                 pointer -= 1
//             }
//         } else if c[0] == "Z" {
//             if let (index, id) = backingStore.popLast() {
//                 if index > table.count {
//                     table.append(id)
//                 } else {
//                     table.insert(id, at: index)
//                 }
//                 if index <= pointer {
//                     pointer += 1
//                 }
//             }
//         }
//     }

//     var answer = Array(repeating: "O", count: initState.count)
//     for state in initState.difference(from: table) {
//         switch state {
//         case .insert(let offset, _, _):
//             answer[offset] = "X"
//         case .remove(let offset, _, _):
//             break
//         }
//     }
//     return answer.joined()
// }

// 링크드 리스트를 이용한 풀이

import Foundation

class Node {
    var up: Node?
    var down: Node?
    var idx = 0
}

func solution(_ n:Int, _ k:Int, _ cmd:[String]) -> String {
    var answer = Array(repeating: "O", count: n)
    var node = Node()
    var pointer = node
    for i in 0..<n-1 {
        node.down = Node()
        node.down?.up = node
        node = node.down!
        node.idx = i + 1
        if i + 1 == k {
            pointer = node
        }
    }
    var backingStore: [Node] = []
    cmd.forEach {
        let command = $0.split(separator: " ")
        switch command[0] {
        case "U":
            for _ in 0..<Int(command[1])! {
                pointer = pointer.up!
            }
        case "D":
            for _ in 0..<Int(command[1])! {
                pointer = pointer.down!
            }
        case "C":
            pointer.up?.down = pointer.down
            pointer.down?.up = pointer.up
            backingStore.append(pointer)
            answer[pointer.idx] = "X"
            if let _ = pointer.down {
                pointer = pointer.down!
            } else {
                pointer = pointer.up!
            }
        case "Z":
            let restore = backingStore.removeLast()
            restore.up?.down = restore
            restore.down?.up = restore
            answer[restore.idx] = "O"
        default:
            break
        }
    }

    return answer.joined()
}
