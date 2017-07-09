
import Foundation

public struct VideoJSONFeed {
    
    public let theJSONData: Data
    
    
    public init?(fromFile name: String, ofType ext: String, in bundle: Bundle) {
        if let filepath = bundle.path(forResource: name, ofType: ext) {
            do {
                theJSONData = try String(contentsOfFile: filepath).data(using: .utf8)!
            } catch {
                return nil
            }
        } else {
            return nil
        }
    }
}
