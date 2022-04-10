import Foundation

func solution(_ prices: [Int]) -> [Int] {
    var result = [Int](repeating: 0, count: prices.count)
    
    for i in 0..<prices.count {
        var tmp = 0
        for j in i+1..<prices.count {
            tmp += 1
            if prices[i] > prices[j] { break }
        }
        result[i] = tmp
    }
    
    return result
}

// swift 지원 안해주는 프로그래머스 채점을 위한 C++ 풀이
/*
#include <string>
#include <vector>

using namespace std;

vector<int> solution(vector<int> prices) {
    vector<int> answer;
    
    for(int i = 0; i < prices.size(); i++) {
        int tmp = 0;
        for(int j = i + 1; j < prices.size(); j++) {
            tmp += 1;
            if (prices[i] > prices[j]) { break; }
        }
        answer.push_back(tmp);
    }
    
    return answer;
}
*/
