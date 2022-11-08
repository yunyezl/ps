#include <iostream>
#include <vector>
#include <stdlib.h>
#include <queue>
#include <cstring>
#include <string>
using namespace std;
#define MAXN 100

struct POS {
    int x;
    int y;
};

int n;
POS positions[MAXN + 10];
int visited[MAXN + 10];
vector<string> result;

int dist(int x, int y, int nx, int ny){
    return abs(x - nx) + abs(y - ny);
}

void inputData() {
    cin >> n;
    for(int i=0; i<n+2; i++){
        cin >> positions[i].x >> positions[i].y;
    }
}

void solve() {
    queue<int> q;

    vector<int> linked[MAXN + 10];

    for(int k=0; k<n+2; k++){
        for(int j=0; j<n+2; j++){
            if(dist(positions[k].x, positions[k].y, positions[j].x, positions[j].y) <= 1000) {
                linked[k].push_back(j);
            } 
        }
    }

    q.push(0);
    visited[0] = true;
    while(!q.empty()) {
        int now = q.front();
        q.pop();
        if (now == n + 1) {
            cout << "happy" << endl;
            return;
        }
        for(int i=0; i<linked[now].size(); i++){
            int next = linked[now][i];
            if(visited[next]) continue;
            visited[next] = true;
            q.push(next);
        }
    }

    cout << "sad" << endl;
}


int main() {
    int t;
    cin >> t;
    while(t){
        inputData();
        memset(visited, 0, sizeof(visited));
        solve();
        t--;
    }

    return 0;
}
