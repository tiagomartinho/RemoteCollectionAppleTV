import SwiftyJSON

public class ItemsService {
    
    public init(){
    }
    
    public func items(callback: ([String]) -> Void) {
        Service().get(ServiceApi.itemsURL) { response in
            guard let data = response.data else { return }
            
            let json = JSON(data: data)
            let name = json[0]["name"].string ?? ""
            
            callback([name])
        }
    }
}