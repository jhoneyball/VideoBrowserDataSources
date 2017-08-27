import Foundation

public struct DataFromBundleFile {
    
    public let data: Data
    
    public init?(fromFile name: String, ofType ext: String, in bundle: Bundle) {
        let stringFromFile: String
        if let filepath = bundle.path(forResource: name, ofType: ext) {
            do {
                stringFromFile = try String(contentsOfFile: filepath)
            } catch {
                return nil // cannot get string out of file
            }
        } else {
            return nil // cannot get filepath from bundle, file name and extension
        }
        if let dataFromStringFromFile = stringFromFile.data(using: .utf8) {
            data = dataFromStringFromFile
        } else {
            return nil // cannot get utf8 data from the string from the file
        }
    }
}
