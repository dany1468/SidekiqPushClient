import XCTest
@testable import SidekiqPushClient

class PayloadTests: XCTestCase {
    func test() {
        let payload = Payload(class: "SampleWorker", args: [123, ["completed": true]], queue: "default", retry: 5)
        XCTAssertEqual(payload.class, "SampleWorker")
        XCTAssertEqual(payload.retry, 5)
        XCTAssertEqual(payload.queue, "default")
    }
}
