#include <iostream>
#include <vector>
#include <string>

using namespace std;

int  main() {
    int t;
    cin>>t;
while(t--){
    int n, q;
    cin >> n>> q;

    //2D matrix number of rows == 26 and column == the lenght of the string 
    vector<vector<int>> frequencyA(26, vector<int>(n + 1, 0));
    vector<vector<int>> frequencyB(26, vector<int>(n + 1, 0));

    string strA, strB;
    cin >> strA >> strB;

    // [strA[i] - 'a'] assign each character to its index in the matrix 
    // and increment its frequency 
    for (int i = 0; i < n; i++) {
        frequencyA[strA[i] - 'a'][i + 1]++;
        frequencyB[strB[i] - 'a'][i + 1]++;
    }

    // Compute prefix sums for both frequency tables
    for (int ch = 0; ch < 26; ch++) {
        for (int i = 1; i <= n; i++) {
            frequencyA[ch][i] += frequencyA[ch][i - 1];
            frequencyB[ch][i] += frequencyB[ch][i - 1];
        }
    }

    for (int query = 0; query < q; query++) {
        int operationsRequired = 0;
        int left, right;
        cin >> left >> right;
        left--;  
        right--;

       
        for (int ch = 0; ch < 26; ch++) {
            int countB = frequencyB[ch][right + 1] - frequencyB[ch][left];
            int countA = frequencyA[ch][right + 1] - frequencyA[ch][left];
            int difference = countB - countA;

            if (difference > 0 ) {
                operationsRequired += difference;
            }
        }

        cout << operationsRequired << "\n";
    }}
}