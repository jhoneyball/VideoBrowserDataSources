

public struct URLImageResolution {
    let horizontalPixels: Int
    let verticalPixels: Int
    var pixels: Int {return horizontalPixels}
    
    init (_ horizontalPixels: Int) {
        self.init(horizontalPixels: horizontalPixels, verticalPixels: 0)
    }
    init (horizontalPixels: Int, verticalPixels: Int) {
        self.horizontalPixels = horizontalPixels
        self.verticalPixels = verticalPixels
    }
}


