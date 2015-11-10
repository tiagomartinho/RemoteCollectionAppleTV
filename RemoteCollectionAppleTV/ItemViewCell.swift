import UIKit
import RemoteServices
import SDWebImage

class ItemViewCell: UICollectionViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var image: UIImageView!

    static let reuseIdentifier = "ItemViewCell"

    var itemView:ItemView? {
        didSet{
            title?.text = itemView?.title
            image?.sd_setImageWithURL(itemView?.imageURL) { [unowned self] imageFromURL, _, _, _ in
                self.setImageTintColor(imageFromURL)
            }
        }
    }
    
    func setImageTintColor(imageFromURL:UIImage) {
        var tintedImage = imageFromURL.imageWithRenderingMode(.AlwaysTemplate)
        UIGraphicsBeginImageContextWithOptions(imageFromURL.size, false, tintedImage.scale)
        self.itemView?.color.set()
        tintedImage.drawInRect(CGRectMake(0, 0, imageFromURL.size.width, imageFromURL.size.height))
        tintedImage = UIGraphicsGetImageFromCurrentImageContext()
        self.image.image = tintedImage
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
            self.image?.backgroundColor = self.focused ? self.itemView?.color : nil
            }, completion: nil)
    }
}