#include <iostream>
#include <vector>

using namespace std;
#define MAXN ((int)1e5)
int N;//빌딩수
int H[MAXN+10];//빌딩높이
int sol[MAXN+10];//각 빌딩에서 보이는 빌딩 번호

void InputData() {
	cin >> N;
	for (int i=1; i<=N; i++){
		cin >> H[i];
	}
}

int main() {
	ios_base::sync_with_stdio(false);
	cin.tie(NULL);
	cout.tie(NULL);

	InputData();//입력받는 부분

	//여기서부터 작성
	std::vector<vector<int>> buildings;
	std::vector<int> ans;

	for(int i = N; i > 0; i--) {
		int now = H[i];
		bool flag = false;
		while (!flag) {
			if(buildings.size() == 0) {
				ans.push_back(0);
				flag = true;		
			} else {
				if (buildings.back()[1] > now) {
					ans.push_back(buildings.back()[0]);
					flag = true;
				} else {
					buildings.pop_back();
				}
			}
		}
		buildings.push_back({i, now});
	}

	for (int i=N-1; i>=0; i--){
		cout << ans[i] << "\n";
	}

	return 0;
}
