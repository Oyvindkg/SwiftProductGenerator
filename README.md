# SwiftProductGenerator
A generic cartesian product generator written in swift similar to Python's [`itertools.Product`](https://docs.python.org/3/library/itertools.html).

## Mission
Reduce memory consumption and processing time for cartesian product of arbitrary collections.

## Usage
The generator is initialized with an array containing the collections to be combined:
```swift
let arrays = [
  [0,1],
  [0,1],
  [0,1]
]

let generator = product(arrays)
```

An equivalent statement would be:
```swift
let generator = product(repeating: [0,1], count: 3)
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
