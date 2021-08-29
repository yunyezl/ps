# swift-algorithm
> 눈물이 차올라서 고갤 들어..

![https://user-images.githubusercontent.com/69361613/131229876-7c517506-9b3a-4f1d-a4ed-4f8047f1e2a3.JPG](https://user-images.githubusercontent.com/69361613/131229876-7c517506-9b3a-4f1d-a4ed-4f8047f1e2a3.JPG)

## 자주 사용되는 것들

### 1. for문 거꾸로 돌리기

#### 0...n의 반대

```swift
for i in stride(from: n, to: 0, by: -1) {
        print(i)
}
// 5 4 3 2 1 
```

#### 0..<n의 반대

```swift
for i in stride(from: n, to: 0, by: -1) {
        print(i)
}
// 5 4 3 2 1 0
```

### 2. 배열 초기화

#### 1차원 배열 초기화

```swift
let array = Array(repeating: 0, count: 5)
print(array)
// [0, 0, 0, 0, 0]
```

#### 2차원 배열 초기화

```swift
var blocks: [[Int]] = Array(repeating: Array(repeating: 0, count: width), count: height)
// width 5, height 3 라고 가정
// [[0, 0, 0, 0, 0], 
//  [0, 0, 0, 0, 0], 
//  [0, 0, 0, 0, 0]]
```


### 3. 문자열 replace

```swift
let string = "hello"
let a = hello.replacingOccurrences(of: "h", with: "q").replacingOccurrences(of: "e", with: "a")

print(a)
// qallo 
```
