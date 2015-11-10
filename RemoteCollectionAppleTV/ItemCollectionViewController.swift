import UIKit
import RemoteServices
import SVProgressHUD

class ItemCollectionViewController: UICollectionViewController {

    private var items = [Item]() {
        didSet {
            self.collectionView?.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        getItems()
    }
    
    func getItems(){
        SVProgressHUD.show()
        RemoteServices.ItemsService().items { response in
            self.items = response
            SVProgressHUD.dismiss()
        }
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