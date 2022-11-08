#include <iostream>
#include <queue>
#include <cstring>
using namespace std;
#define MAXN 51

struct SHORE {
    int x;
    int y;
    int dist;
};

int n, m;
char map[MAXN+10][MAXN+10];
int visited[MAXN+10][MAXN+10];
int dx[4] = {-1, 1, 0, 0};
int dy[4] = {0, 0, -1, 1};

void input_data() {
    cin >> n >> m;
    for(int i=0; i<n; ++i){
        for(int j=0; j<m; j++){
            cin >> map[i][j];
        }
    }
}

int bfs(int x, int y){
    queue<SHORE> q;
    q.push({x, y, 1});
    visited[x][y] = true;
    int result = 0;

    while(!q.empty()){
        int x = q.front().x;
        int y = q.front().y;
        int dist = q.front().dist;
        q.pop();
        for(int i=0; i<4; i++){
            int nx = x + dx[i];
            int ny = y + dy[i];
            if(nx < 0 || ny < 0 || nx >= n || ny >= m) continue;
            if(map[nx][ny] == 'L' && !visited[nx][ny]) {
                visited[nx][ny] = true;
                q.push({nx, ny, dist + 1});
                if (result < dist + 1) {
                    result = dist + 1;
                }
            }
        }
    }
    return result - 1;
}

int main() {
    input_data();
    int ans = 0;
    for(int i=0; i<n; i++){
        for(int j=0; j<m; j++){
            if(map[i][j] == 'L'){
                int time = bfs(i, j);
                if (ans < time) {
                    ans = time;
                }
            }
            memset(visited, 0, sizeof(visited));
        }
    }
    cout << ans << endl;

    return 0;
}
