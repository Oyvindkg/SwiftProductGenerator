# SwiftProductGenerator
A generic cartesian product generator written in swift

Similar to Pythons itertools.Product

## Mission
Reduce memory consumption and processing time for cartesian product of arbitrary arrays


## Usage
The generator is initialized with an array containing the arrays to be combined:
```swift
let arrays = [
  [0,1],
  [0,1],
  [0,1]
]

let generator = ProductGenerator(arrays: arrays)
```

An equivalent statement would be:
```swift
let generator = ProductGenerator(array: [0,1], repeat: 2)
```

The generator from the examples will generate this array lazily
```swift
[
  [0, 0, 0]
  [0, 0, 1]
  [0, 1, 0]
  [0, 1, 1]
  [1, 0, 0]
  [1, 0, 1]
  [1, 1, 0]
  [1, 1, 1]
]
```


