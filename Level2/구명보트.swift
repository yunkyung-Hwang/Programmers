// 무게순으로 내림차순 정렬
// 무거운애 먼저 태우고 가벼운 애들 순서로 배에 태우기

import Foundation

func solution(_ people: [Int], _ limit: Int) -> Int {
    var result = 0
    let tmp = people.sorted(by: >)
    var index = people.count - 1
    
    for i in 0..<tmp.count {
        var ship = tmp[i]
        while ship + tmp[index] <= limit {
            index -= 1
            ship += tmp[index]
        }
        result += 1
        if index <= i { break }
    }
    
    return result
}

// swift 지원 안해주는 프로그래머스 채점을 위한 C++ 풀이
/*
#include <string>
#include <vector>
#include <algorithm>

using namespace std;

int solution(vector<int> people, int limit) {
    int result = 0;
    int index = people.size() - 1;
    
    sort(people.rbegin(), people.rend());
    
    for(int i = 0; i<people.size(); i++) {
        int ship = people[i];
        while(ship + people[index] <= limit) {
            index -= 1;
            ship += people[index];
        }
        result += 1;
        if(index <= i) { break; }
    }
    
    return result;
}
*/
