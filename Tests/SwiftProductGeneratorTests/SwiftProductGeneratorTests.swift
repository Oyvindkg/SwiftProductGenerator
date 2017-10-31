import XCTest
@testable import SwiftProductGenerator

class SwiftProductGeneratorTests: XCTestCase {
    func testEmptySet() {
        let gen = Product<Int, [Int]>([])
        let res = gen.map{ $0 }
        XCTAssertTrue(res.isEmpty)
    }

    func testSingleton() {
        let gen = Product([[0,1,2]])
        let res = gen.map{ $0 }

        XCTAssertEqual(res.count, 3)
        XCTAssertTrue(res.contains{ $0 == [0] })
        XCTAssertTrue(res.contains{ $0 == [1] })
        XCTAssertTrue(res.contains{ $0 == [2] })
    }

    func testPair() {
        let gen = Product([[0,1], [1,2]])
        let res = gen.map{ $0 }

        XCTAssertEqual(res.count, 4)
        XCTAssertTrue(res.contains{ $0 == [0,1] })
        XCTAssertTrue(res.contains{ $0 == [0,2] })
        XCTAssertTrue(res.contains{ $0 == [1,1] })
        XCTAssertTrue(res.contains{ $0 == [1,2] })
    }

    func testTriple() {
        let gen = Product([[0,1], [1,2], [2,3]])
        let res = gen.map{ $0 }

        XCTAssertEqual(res.count, 8)
        XCTAssertTrue(res.contains{ $0 == [0,1,2] })
        XCTAssertTrue(res.contains{ $0 == [0,1,3] })
        XCTAssertTrue(res.contains{ $0 == [0,2,2] })
        XCTAssertTrue(res.contains{ $0 == [0,2,3] })
        XCTAssertTrue(res.contains{ $0 == [1,1,2] })
        XCTAssertTrue(res.contains{ $0 == [1,1,3] })
        XCTAssertTrue(res.contains{ $0 == [1,2,2] })
        XCTAssertTrue(res.contains{ $0 == [1,2,3] })
    }

    func testRepeatingInitializer() {
        let gen = Product(repeating: [0,1], count: 3)
        let res = gen.map{ $0 }

        XCTAssertEqual(res.count, 8)
        XCTAssertTrue(res.contains{ $0 == [0,0,0] })
        XCTAssertTrue(res.contains{ $0 == [0,0,1] })
        XCTAssertTrue(res.contains{ $0 == [0,1,0] })
        XCTAssertTrue(res.contains{ $0 == [0,1,1] })
        XCTAssertTrue(res.contains{ $0 == [1,0,0] })
        XCTAssertTrue(res.contains{ $0 == [1,0,1] })
        XCTAssertTrue(res.contains{ $0 == [1,1,0] })
        XCTAssertTrue(res.contains{ $0 == [1,1,1] })
    }

    static var allTests = [
        ("testEmptySet"            , testEmptySet),
        ("testSingleton"           , testEmptySet),
        ("testPair"                , testEmptySet),
        ("testTriple"              , testEmptySet),
        ("testRepeatingInitializer", testRepeatingInitializer),
    ]
}
