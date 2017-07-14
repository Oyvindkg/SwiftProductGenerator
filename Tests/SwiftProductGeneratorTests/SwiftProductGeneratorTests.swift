import XCTest
@testable import SwiftProductGenerator

class SwiftProductGeneratorTests: XCTestCase {
    func testEmptySet() {
        let gen = Product<Int>([])
        let res = gen.map{ $0 }
        XCTAssertTrue(res[0].isEmpty)
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

    static var allTests = [
        ("testEmptySet" , testEmptySet),
        ("testSingleton", testEmptySet),
        ("testPair"     , testEmptySet),
        ("testTriple"   , testEmptySet),
    ]
}
