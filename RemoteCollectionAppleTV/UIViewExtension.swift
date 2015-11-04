import UIKit

extension UIView {
    func addView(viewToAdd:UIView){
        viewToAdd.frame = self.bounds
        viewToAdd.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        self.addSubview(viewToAdd)
    }
}