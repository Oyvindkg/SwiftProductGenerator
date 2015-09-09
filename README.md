# SwiftProductGenerator
A cartesian product generator written in swift


## Usage
The generator can be initialized with an array containing the arrays to be combined
```swift
let arrays = [
  [0,1],
  [0,1]
]

let generator = ProductGenerator(arrays: arrays)
```

An equivalent statement would be
```swift
let generator = ProductGenerator(array: [0,1], repeat: 2)
```

