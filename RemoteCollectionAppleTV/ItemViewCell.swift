import UIKit
import RemoteServices
import SDWebImage

class ItemViewCell: UICollectionViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var containerView: UIView!
    
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
        title.alpha = 0.0
        name.alpha = 0.0
        logo.alpha = 0.0
        containerView.backgroundColor = nil
    }
    
    // MARK: UIFocusEnvironment
    
    override func didUpdateFocusInContext(context: UIFocusUpdateContext, withAnimationCoordinator coordinator: UIFocusAnimationCoordinator) {
        coordinator.addCoordinatedAnimations({ [unowned self] in
            self.title.alpha = self.focused ? 1.0 : 0.0
            self.name.alpha = self.focused ? 1.0 : 0.0
            self.logo.alpha = self.focused ? 1.0 : 0.0
            self.containerView.backgroundColor = self.focused ? self.item?.color.colorWithAlphaComponent(0.5) : nil
            }, completion: nil)
    }
}