import UIKit
import RemoteServices

class ItemCollectionViewController: UICollectionViewController {

    private var items = [Item]() {
        didSet {
            self.collectionView?.reloadData()
        }
    }

    var activityIndicator:UIActivityIndicatorView?

    override func viewDidLoad() {
        super.viewDidLoad()
        initLoadingInterface()
        getItems()
    }
    
    func initLoadingInterface(){
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .WhiteLarge)
        self.view.addSubview(activityIndicator)
        self.activityIndicator = activityIndicator
        self.activityIndicator?.startAnimating()
    }
    
    func getItems(){
        RemoteServices.ItemsService().items { response in
            self.items = response
            self.stopLoadingInterface()
        }
    }
    
    func stopLoadingInterface(){
        self.activityIndicator?.stopAnimating()
    }
    
    // MARK : viewWillLayoutSubviews
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let viewBounds = self.view.bounds
        self.activityIndicator?.center = CGPointMake(CGRectGetMidX(viewBounds), CGRectGetMidY(viewBounds))
    }
    
    // MARK: UICollectionViewDataSource

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(ItemViewCell.reuseIdentifier, forIndexPath: indexPath) as! ItemViewCell
        cell.item = items[indexPath.row]
        return cell
    }
}