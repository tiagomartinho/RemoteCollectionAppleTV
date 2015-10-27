import SwiftyJSON

public class ItemsService {
    
    public init(){
    }
    
    public func items(callback: ([Item]) -> Void) {
        Service().get(ServiceApi.itemsURL) { response in
            guard let data = response.data else { return }
            
            let json = JSON(data: data)
            let item = Item(json: json[0])
            
            callback([item])
        }
    }
}