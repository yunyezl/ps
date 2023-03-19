import Foundation

class TrieNode {
    var isLeaf: Bool = false
    var children: [Character: TrieNode] = [:]
    
    func findNode(_ char: Character) -> TrieNode {
        if let child = children[char] {
            return child
        }
        
        let newNode = TrieNode()
        children[char] = newNode
        return newNode
    }
}

class WordDictionary {
    let root: TrieNode

    init() {
        root = TrieNode()
    }
    
    func addWord(_ word: String) {
        var currentNode = root
        for char in word {
            currentNode = currentNode.findNode(char)
        }
        
        currentNode.isLeaf = true
    }
    
    func search(_ word: String) -> Bool {
        return searchWord(Array(word), 0, root)
    }
    
    private func searchWord(_ word: [Character], _ index: Int, _ node: TrieNode) -> Bool {
        if index == word.count {
            return node.isLeaf
        }
        
        let char = word[index]
        if char == "." {
            for child in node.children.values {
                if searchWord(word, index + 1, child) {
                    return true
                }
            }
            return false
        }
        
        guard let child = node.children[char] else {
            return false
        }
        
        return searchWord(word, index + 1, child)
    }
}
