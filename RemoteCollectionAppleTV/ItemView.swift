import UIKit
import RemoteServices
import SDWebImage

class ItemView: ReusableView {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    override func nibName()->String {
        return "ItemView"
    }

    var item:Item? {
        didSet{
            title?.text = item?.name
            image?.sd_setImageWithURL(item?.iconURL)
            view.backgroundColor = item?.color
        }
    }
}