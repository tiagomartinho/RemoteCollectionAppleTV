import Foundation
import SwiftyJSON

extension Item {
    init(json:JSON){
        self.id = json["id"].int ?? 0
        self.name = json["name"].string ?? ""
        self.color = UIColor(color: json["color"].string ?? "")
        self.iconURL = NSURL(string: json["iconURL"].string ?? "")!
        self.title = json["title"].string ?? ""
        self.content = json["content"].string ?? ""
        self.imageURL = NSURL(string: json["imageURL"].string ?? "")!
    }
}

extension Item {
    static func itemsCollection(data:NSData)->[Item]{
        let json = JSON(data: data)
        return json.map { Item(json: $1) }
    }
}