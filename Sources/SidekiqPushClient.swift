import Foundation
import Wrap

public enum SidekiqPushError: Error {
    case serializingJsonFailed
}

public struct SidekiqPushClient {
    let redisClient: RedisClient

    public init(_ redisHost: String, _ redisPort: Int32) {
        self.redisClient = RedisClient(redisHost, redisPort)
    }

    public init() {
        self.redisClient = RedisClient()
    }

    public func push(class: String, args: Array<Any> = [], queue: String = "default", retry: Int = 25) throws -> String {
        let payload = Payload(class: `class`, args: args, queue: queue, retry: retry)

        try redisClient.rawPush(queue, try dumpJson(payload))

        return payload.jid
    }

    func dumpJson(_ payload: Payload) throws -> String {
        let dictionary: [String: Any] = try! wrap(payload)
        do {
            let data = try JSONSerialization.data(withJSONObject: dictionary, options: [])
            return String(data: data, encoding: .utf8)!
        } catch {
            throw SidekiqPushError.serializingJsonFailed
        }
    }
}
