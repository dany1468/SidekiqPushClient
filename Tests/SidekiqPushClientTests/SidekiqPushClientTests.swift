import XCTest
@testable import SidekiqPushClient

class SidekiqPushClientTests: XCTestCase {
    func testPush() {
        let client = SidekiqPushClient()

        try! client.push(class: "SampleWorker", args: [123, ["completed": true]])
    }

    static var allTests : [(String, (SidekiqPushClientTests) -> () throws -> Void)] {
        return [
            ("testPush", testPush),
        ]
    }
}
