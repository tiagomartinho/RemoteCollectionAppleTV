import UIKit
import RemoteServices

class ItemCollectionViewController: UICollectionViewController {

    private var items = [Item]() {
        didSet {
            self.collectionView?.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        RemoteServices.ItemsService().items { response in
            self.items = response
        }
    }
    
    // MARK: UICollectionViewDataSource

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ItemViewCell", forIndexPath: indexPath)
        let itemView = ItemView()
        itemView.title.text = items[indexPath.row].name
        itemView.frame = cell.bounds
        itemView.autoresizingMask = UIViewAutoresizing.FlexibleWidth.union(UIViewAutoresizing.FlexibleHeight)
        cell.addSubview(itemView)
        return cell
    }
}