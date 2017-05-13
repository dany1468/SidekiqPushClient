import Foundation
import Wrap

public struct Payload: WrapCustomizable {
    public let `class`: String
    public let args: Array<Any>
    public let retry: Int
    public let queue: String
    public let jid: String
    public let createdAt: Double
    public let enqueuedAt: Double

    public var wrapKeyStyle: WrapKeyStyle { return .convertToSnakeCase }

    init(class: String, args: Array<Any>, queue: String, retry: Int) {
        self.class = `class`
        self.args = args
        self.retry = retry
        self.queue = queue
        self.jid = JidGenerator.provide(12)
        let now = Date().timeIntervalSince1970
        self.createdAt = now
        self.enqueuedAt = now
    }
}
