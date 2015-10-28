public class ItemsService {
    
    var service:Service
    
    public init(service:Service = Service()){
        self.service = service
    }
    
    public func items(callback: ([Item]) -> Void) {
        service.get(ServiceApi.itemsURL) { response in
            guard let data = response.data else { return }
            callback(Item.itemsCollection(data))
        }
    }
}