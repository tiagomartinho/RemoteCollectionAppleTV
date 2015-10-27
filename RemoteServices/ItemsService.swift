public class ItemsService {
    
    public init(){
    }
    
    public func items(callback: ([Item]) -> Void) {
        Service().get(ServiceApi.itemsURL) { response in
            guard let data = response.data else { return }
            callback(Item.itemsCollection(data))
        }
    }
}