import UIKit
import RemoteServices
import SVProgressHUD

class ItemCollectionViewController: UICollectionViewController {
    
    private var items = [Item]()

    override func viewDidLoad() {
        super.viewDidLoad()
        getItems()
    }
    
    private func getItems(){
        SVProgressHUD.show()
        RemoteServices.ItemsService().items { [unowned self] response in
            self.items = response
            self.collectionView?.reloadData()
            SVProgressHUD.dismiss()
        }
    }
    
    // MARK: UICollectionViewDataSource

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(ItemViewCell.reuseIdentifier, forIndexPath: indexPath) as! ItemViewCell
        cell.itemView = items[indexPath.row]
        return cell
    }
}