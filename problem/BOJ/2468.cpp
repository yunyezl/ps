#include <iostream>
#include <stdio.h>
#include <queue>
#include <cstring>
using namespace std;
#define MAXN 101

int N;
int map[MAXN + 10][MAXN + 10];
int safe_map[MAXN + 10][MAXN + 10];
int visited[MAXN + 10][MAXN + 10];
int dx[4] = {-1, 1, 0, 0};
int dy[4] = {0, 0, -1, 1};

void input_data() {
    cin >> N;
    for(int i=0; i<N; i++){
        for(int j=0; j<N; j++){
            scanf("%d", &map[i][j]);
        }
    }
}

void bfs(int x, int y, int height) {
    queue<pair<int, int>> q;
    q.push({x, y});
    visited[x][y] = true;
    while (!q.empty()) {
        int x = q.front().first;
        int y = q.front().second;
        q.pop();
        for(int i=0; i<4; i++){
            int nx = x + dx[i];
            int ny = y + dy[i];
            if(nx < 0 || ny < 0 || nx >= N || ny >= N) continue;
            if(visited[nx][ny] || map[nx][ny] <= height) continue;
            visited[nx][ny] = true;
            q.push({nx, ny});
        }
    }
}

void solve() {
    int height = 0;
    int ans = -1;
    while(true){
        int safety_area = 0;
        memset(visited, 0, sizeof(visited));
        for(int i=0; i<N; i++){
            for(int j=0; j<N; j++){
                if(visited[i][j]) continue;
                if(map[i][j] > height) {
                    bfs(i, j, height);
                    safety_area++;
                }
            }
        }
        if (safety_area > ans) {
            ans = safety_area;
        }
        if (safety_area == 0) {
            break;
        }
        height++;
    }
    cout << ans << endl;
}

int main() {
    input_data();
    solve();
    return 0;
}
