import XCTest
@testable import SidekiqPushClient

class SidekiqPushClientTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(SidekiqPushClient().text, "Hello, World!")
    }


    static var allTests : [(String, (SidekiqPushClientTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
