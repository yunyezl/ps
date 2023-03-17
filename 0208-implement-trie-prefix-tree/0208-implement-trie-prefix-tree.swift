import Foundation

class TrieNode {
    var key: String?
    var children: [Character: TrieNode] = [:]
    
    func createNode(_ char: Character) -> TrieNode {
        // 자식 노드 중 같은 문자가 있는 경우 해당 노드 리턴
        if let child = children[char] {
            return child
        }
        
        // 자식 노드 중 같은 문자가 없으면 새로운 노드 생성
        let newNode = TrieNode()
        children[char] = newNode
        return newNode
    }
}

class Trie {
    let root: TrieNode

    init() {
        root = TrieNode()
    }
    
    func insert(_ word: String) {
        var currentNode = root
        for char in word {
            currentNode = currentNode.createNode(char)
        }
        
        currentNode.key = word
    }
    
    func search(_ word: String) -> Bool {
        var currentNode = root
        for char in word {
            if currentNode.children[char] == nil {
                return false
            }
            currentNode = currentNode.children[char]!
        }
        
        return currentNode.key == word
    }

    func startsWith(_ prefix: String) -> Bool {
        var currentNode = root
        for char in prefix {
            if currentNode.children[char] == nil {
                return false
            }
            currentNode = currentNode.children[char]!
        }
        
        return true
    }
}