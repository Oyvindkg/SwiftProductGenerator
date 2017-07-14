//
//  SwiftProductGenerator.swift
//
//
//  Created by Øyvind Grimnes on 09/09/15.
//
//


/**
A cartesian product generator

:discussion:    Generates the cartesian product of arrays, or repetitions of an array. The rightmost element is advanced every iteration which ensures that if the input is sorted, the output will be sorted as well.
*/

public struct product<T>: IteratorProtocol, Sequence {

    /// Private variable to manage where to get next element in each pool
    private var indices : [Int]
    /// Pool containing all the arrays to be combined
    private var pools : [[T]]
    /// Terminate the generation on completion
    private var done : Bool = false


    /**
    Initiates the generator with an array of arrays to be combined

    :param:     arrays  array containing arrays to be combined

    :returns:   An array containing the products of the provided arrays
    */

    public init(_ arrays: [[T]]) {

        self.pools = arrays
        self.indices = [Int](repeating: 0, count: self.pools.count)
        self.done = pools.filter({$0.count == 0}).count != 0
    }


    /**
    Initiates the generator with an array repeated 'repeat' times

    :param:     array   array containing elements to be combined
    :param:     repeat  number of elements in product

    :returns:   An array containing the products of the provided array repeated 'repeat' times
    */

    public init(_ array: [T], repeats: Int) {
        assert(repeats >= 0, "repeats must be >= 0")

        self.pools = [[T]](repeating: array, count: repeats)
        self.indices = [Int](repeating: 0, count: self.pools.count)
        self.done = repeats <= 0 && pools.filter({$0.count == 0}).count != 0
    }


    /**
    Generate the next element and return it

    :returns:   An optional element
    */

    public mutating func next() -> [T]? {
        if done {
            return nil
        }

        let element = pools.enumerated().map {
            $1[ self.indices[$0] ]
        }

        self.incrementLocationInPool(poolIndex: self.pools.count-1)
        return element
    }


    /**
    Initiates the generator with an array of arrays to be combined

    :discussion:    The location in the pool for the provided 'poolIndex' will be incremented. If the new location is out of range, the location is set to zero and the location in the preceding pool will be incremented. If 'poolIndex' is less than zero, the generation is complete.

    :param:         poolIndex   index of the pool for which to update the location

    :returns:       An array containing the products of the provided array repeated 'repeat' times
    */

    mutating private func incrementLocationInPool(poolIndex: Int) {
        if poolIndex < 0 {
            return done = true
        }

        indices[poolIndex] += 1

        if indices[poolIndex] == pools[poolIndex].count {
            indices[poolIndex] = 0
            incrementLocationInPool(poolIndex: poolIndex-1)
        }
    }


    /**
    Returns a cartesian product generator

    :returns:       A cartesian product generator
    */
    public func generate() -> product {
        return self
    }
}
