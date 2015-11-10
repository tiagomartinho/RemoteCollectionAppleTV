import UIKit

protocol ItemView {
    var title:String { get }
    var imageURL:NSURL { get }
    var color:UIColor { get }
}