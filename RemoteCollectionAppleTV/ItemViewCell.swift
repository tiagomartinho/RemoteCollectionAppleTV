import UIKit
import RemoteServices
import SDWebImage

class ItemViewCell: UICollectionViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var contentBackgroundView: UIView!
    
    static let reuseIdentifier = "ItemViewCell"
    
    var item:Item? {
        didSet{
            title?.text = item?.title
            name?.text = item?.name
            image?.sd_setImageWithURL(item?.imageURL)
            logo?.sd_setImageWithURL(item?.iconURL)
        }
    }
    
    // MARK: Initialization
    
    override func awakeFromNib() {
        super.awakeFromNib()
        image.adjustsImageWhenAncestorFocused = true
        image.clipsToBounds = false
        initialViewsState()
    }
    
    // MARK: UICollectionReusableView
    
    override func prepareForReuse() {
        super.prepareForReuse()
        initialViewsState()
    }
    
    func initialViewsState(){
//        title.alpha = 0.0
//        name.alpha = 0.0
//        logo.alpha = 0.0
        image.alpha = 0.75
        containerView.alpha = 0.0
        contentBackgroundView.backgroundColor = nil
    }
    
    // MARK: UIFocusEnvironment
    
    override func didUpdateFocusInContext(context: UIFocusUpdateContext, withAnimationCoordinator coordinator: UIFocusAnimationCoordinator) {
        coordinator.addCoordinatedAnimations({ [unowned self] in
//            self.title.alpha = self.focused ? 1.0 : 0.0
//            self.name.alpha = self.focused ? 1.0 : 0.0
//            self.logo.alpha = self.focused ? 1.0 : 0.0
            self.image.alpha = self.focused ? 1.0 : 0.75
            self.containerView.alpha = self.focused ? 1.0 : 0.0
            self.contentBackgroundView.backgroundColor = self.focused ? self.item?.color.colorWithAlphaComponent(0.75) : nil
            }, completion: nil)
    }
}