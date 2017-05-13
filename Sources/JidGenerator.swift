import Foundation

public class JidGenerator {
    public static func provide(_ count: Int) -> String {
        var randomBytes = [UInt8](repeating: 0, count: count)
        let _ = SecRandomCopyBytes(kSecRandomDefault, count, &randomBytes)
    
        return randomBytes.map { String(format: "%02hhx", $0) }.joined()
    }
}
