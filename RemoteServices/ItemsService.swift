import Alamofire
import SwiftyJSON

public class ItemsService {
    
    public init(){
    }
    
    public func items(callback: ([String]) -> Void) {
        Alamofire.request(.GET, "http://private-e765e-squeezeapi.apiary-mock.com/items")
            .validate()
            .responseJSON { response in
                guard let data = response.data else { return }
                
                let json = JSON(data: data)
                let name = json[0]["name"].string ?? ""
                
                callback([name])
        }
    }
}