import UIKit

class ItemView: ReusableView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        super.xibSetup("ItemView")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        super.xibSetup("ItemView")
    }
    
    @IBOutlet weak var title: UILabel!
}