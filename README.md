# swift-algorithm
> 눈물이 차올라서 고갤 들어..

![https://user-images.githubusercontent.com/69361613/131229876-7c517506-9b3a-4f1d-a4ed-4f8047f1e2a3.JPG](https://user-images.githubusercontent.com/69361613/131229876-7c517506-9b3a-4f1d-a4ed-4f8047f1e2a3.JPG)

## 알고리즘 정리
[Union Find](https://www.notion.so/union-find-5e2876ba63a74d76b569dee5d43073bd)  
[Dynamic Programming](https://www.notion.so/Dynamic-Programming-42ea569a8a2347e2825cf5f0ea3f0f9e)  
[LIS](https://www.notion.so/LIS-c6bfab941b7e434283300fc2d47ffea0)

## 자주 사용되는 문법

### 1. for문 거꾸로 돌리기

#### 0...n의 반대

```swift
for i in stride(from: 5, through: 0, by: -1) {
        print(i)
}
// 5 4 3 2 1 0
```

#### 0..<n의 반대

```swift
for i in stride(from: 5, to: 0, by: -1) {
        print(i)
}
// 5 4 3 2 1 
```

### 2. 배열

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


### 3. 문자열 

#### 문자열 replaceing

```swift
let string = "hello"
let a = hello.replacingOccurrences(of: "h", with: "q").replacingOccurrences(of: "e", with: "a")

print(a)
// qallo 
```

#### hasPrefix - 문자열이 어떤 글자로 시작하는 지 확인
```swift
if newId.hasPrefix(".") {
        ...
}
// newId가 .으로 시작하면 true 값 반환
```

#### hasPrefix - 문자열이 어떤 글자로 끝나는 지 확인
```swift
if newId.hasSuffix(".") {
        ...
}
// newId가 .으로 끝나면 true 값 반환
```

