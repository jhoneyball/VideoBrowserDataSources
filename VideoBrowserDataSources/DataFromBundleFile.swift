
import Foundation

public struct DataFromBundleFile {
    
    public let data: Data

    public init?(fromFile name: String, ofType ext: String, in bundle: Bundle) {
        if let filepath = bundle.path(forResource: name, ofType: ext) {
            do {
                data = try String(contentsOfFile: filepath).data(using: .utf8)!
                
            } catch {
                return nil
            }
        } else {
            return nil
        }
    }
}
