#include <iostream>
using namespace std;

int main() {
    int t;
    cin >> t; 
    while (t--) {
        long long n, m;
        cin >> n >> m; 
        if (n % m == 0) {
            cout << "NO" << endl; 
        } else {
            cout << "YES" << endl; 
        }
    }
    return 0;
}