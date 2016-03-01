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
        initialViewsState()
    }
    
    // MARK: UICollectionReusableView
    
    override func prepareForReuse() {
        super.prepareForReuse()
        initialViewsState()
    }
    
    func initialViewsState(){
        image.alpha = 0.75
        containerView.alpha = 0.0
        contentBackgroundView.backgroundColor = nil
    }
    
    // MARK: UIFocusEnvironment
    
    override func didUpdateFocusInContext(context: UIFocusUpdateContext, withAnimationCoordinator coordinator: UIFocusAnimationCoordinator) {
        
        if context.nextFocusedView == self {
            contentView.addGestureRecognizer(panGesture)
        }
        else {
            contentView.removeGestureRecognizer(panGesture)
        }
        
        coordinator.addCoordinatedAnimations({ () -> Void in
            self.transform = self.focused ? self.focusedTransform : CGAffineTransformIdentity
            self.image.alpha = self.focused ? 1.0 : 0.75
            self.containerView.alpha = self.focused ? 1.0 : 0.0
            self.contentBackgroundView.backgroundColor = self.focused ? self.item?.color.colorWithAlphaComponent(0.75) : nil
            }, completion: nil)
    }
    
    var focusedTransform: CGAffineTransform {
        return CGAffineTransformMakeScale(1.10, 1.10)
    }
    
    private lazy var panGesture: UIPanGestureRecognizer = {
        let pan = UIPanGestureRecognizer(target: self, action: Selector("viewPanned:"))
        pan.cancelsTouchesInView = false
        return pan
    }()
    
    var initialPanPosition: CGPoint?
    
    func viewPanned(pan: UIPanGestureRecognizer) {
        switch pan.state {
        case .Began:
            initialPanPosition = pan.locationInView(contentView)
        case .Changed:
            if let initialPanPosition = initialPanPosition {
                let currentPosition = pan.locationInView(contentView)
                let diff = CGPoint(
                    x: currentPosition.x - initialPanPosition.x,
                    y: currentPosition.y - initialPanPosition.y
                )
                
                let parallaxCoefficientX = 1 / self.frame.width * 16
                let parallaxCoefficientY = 1 / self.frame.height * 16
                
                self.transform = CGAffineTransformConcat(
                    focusedTransform,
                    CGAffineTransformMakeTranslation(
                        diff.x * parallaxCoefficientX,
                        diff.y * parallaxCoefficientY
                    )
                )
            }
        default:
            UIView.animateWithDuration(0.3,
                delay: 0,
                usingSpringWithDamping: 0.8,
                initialSpringVelocity: 0,
                options: .BeginFromCurrentState,
                animations: { () -> Void in
                    self.transform = self.focusedTransform
                },
                completion: nil)
        }
    }
}