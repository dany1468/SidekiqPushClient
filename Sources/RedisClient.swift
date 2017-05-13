import Foundation
import SwiftRedis

public enum RedisError: Error {
    case connectionFailed(NSError)
    case errorResponseReturned(String)
}

struct RedisClient {
    let host: String
    let port: Int32
    let redis: Redis

    init(_ host: String = "localhost", _ port: Int32 = 6379) {
        self.host = host
        self.port = port
        self.redis = Redis()
    }

    func rawPush(_ queue: String, _ payloadJson: String) throws -> Void {
        var happendError: RedisError?
        
        redis.connect(host: host, port: port) { (redisError: NSError?) in
            if let error = redisError {
                happendError = RedisError.connectionFailed(error)
            }
            else {
                let multi = redis.multi()
                
                multi.sadd("queues", members: queue)
                multi.lpush("queue:\(queue)", values: payloadJson)
                
                multi.exec() { (response: RedisResponse) in
                    if let errorStr = response.asError {
                        happendError = RedisError.errorResponseReturned(errorStr)
                    }
                }
            }
        }
        
        if let error = happendError {
            throw error
        }
    }
}
