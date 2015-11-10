import RemoteServices
import UIKit

extension Item: ItemView {
    var title:String { return self.name }
    var imageURL:NSURL { return self.iconURL }
    var color:UIColor { return self.color }
}