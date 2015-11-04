import UIKit

@IBDesignable
class ReusableView: UIView {
    
    var view: UIView!
    
    func xibSetup(nibName:String) {
        view = loadViewFromNib(nibName)
        view.frame = bounds
        view.autoresizingMask = UIViewAutoresizing.FlexibleWidth.union(UIViewAutoresizing.FlexibleHeight)
        addSubview(view)
    }
    
    func loadViewFromNib(nibName:String) -> UIView {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiateWithOwner(self, options: nil)[0] as! UIView
    }
}