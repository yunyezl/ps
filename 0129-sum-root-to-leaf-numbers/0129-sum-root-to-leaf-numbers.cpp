/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode() : val(0), left(nullptr), right(nullptr) {}
 *     TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
 *     TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}
 * };
 */
class Solution {
public:
    int sumNumbers(TreeNode* root) {
        return search_child(root, 0);
    }
    
    int search_child(TreeNode* node, int sum) {
        if (!node) {
            return 0;
        }
        
        int current_sum = sum * 10 + node->val;
        
        if (!node->left && !node->right) {
            return current_sum;
        }
        
        int left = search_child(node->left, current_sum);
        int right = search_child(node->right, current_sum);
        
        return left + right;
    }
};
