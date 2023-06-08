// 문제
// 캐시 크기에 따른 실행 시간 측정 프로그램 작성
// LRU: 가장 오래전에 쓴걸 지우기
// 있던걸 부르면 맨앞으로
// 없는걸 부르면 제일 오래된거 삭제하고 현재꺼 맨앞에 넣고

// 시간복잡도
// 캐시 크기 <= 30, 도시 수 <= 십만
// 3000000 3백만

func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    var result = 0
    var cache = [String]()
    
    for city in cities {
        let city = city.uppercased()
        if cache.contains(city) {
            cache.append(cache.remove(at: cache.firstIndex(of: city)!))
            result += 1
        } else {
            cache.append(city)
            if cache.count > cacheSize {
                cache.removeFirst()    
            }
            result += 5
        }
    }
    
    return result
}
