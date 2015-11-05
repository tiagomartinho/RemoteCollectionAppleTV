import UIKit

extension UIColor {
    convenience init(color: String){
        var hexValue:UInt32 = 0
        NSScanner(string: color).scanHexInt(&hexValue)
        self.init(hex: hexValue)
    }
    
    convenience init(hex: UInt32){
        self.init(red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hex & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0))
    }
}