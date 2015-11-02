import UIKit
import RemoteServices

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        RemoteServices.ItemsService().items { response in
            print(response)
        }
    }
}

