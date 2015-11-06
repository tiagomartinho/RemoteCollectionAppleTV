import UIKit
import RemoteServices

class ItemView: ReusableView {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    override func nibName()->String {
        return "ItemView"
    }
    
    var item:Item? {
        didSet{
            title?.text = item?.name
            //image?.image = item?.icon
            view.backgroundColor = item?.color
        }
    }
}