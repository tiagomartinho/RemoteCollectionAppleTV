import Alamofire

class Service {
    
    func get(url:String, callback: Response<AnyObject, NSError> -> Void) {
        Alamofire.request(.GET, url)
            .validate()
            .responseJSON(completionHandler: callback)
    }
}