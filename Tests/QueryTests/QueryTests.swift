import XCTest
@testable import Query

class QueryTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(Query().text, "Hello, World!")
    }


    static var allTests : [(String, (QueryTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
