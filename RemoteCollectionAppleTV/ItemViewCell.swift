import UIKit
import RemoteServices
import SDWebImage

class ItemViewCell: UICollectionViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var image: UIImageView!

    static let reuseIdentifier = "ItemViewCell"

    var item:Item? {
        didSet{
            title?.text = item?.name
            image?.sd_setImageWithURL(item?.iconURL)
            self.backgroundColor = item?.color
        }
    }
    
    // MARK: Initialization
    
    override func awakeFromNib() {
        super.awakeFromNib()
        image.adjustsImageWhenAncestorFocused = true
        image.clipsToBounds = false
        title.alpha = 0.0
    }
    
    // MARK: UICollectionReusableView
    
    override func prepareForReuse() {
        super.prepareForReuse()
        title.alpha = 0.0
    }
    
    // MARK: UIFocusEnvironment
    
    override func didUpdateFocusInContext(context: UIFocusUpdateContext, withAnimationCoordinator coordinator: UIFocusAnimationCoordinator) {
        coordinator.addCoordinatedAnimations({ [unowned self] in
                self.title.alpha = self.focused ? 1.0 : 0.0
            }, completion: nil)
    }
}