import Foundation
import SwiftyJSON

extension Item {
    init(json:JSON){
        self.id = json["id"].int ?? 0
        self.name = json["name"].string ?? ""
        self.color = json["color"].string ?? ""
        self.icon = json["iconURL"].string ?? ""
    }
}

extension Item {
    static func itemsCollection(data:NSData)->[Item]{
        let json = JSON(data: data)
        return json.map { Item(json: $1) }
    }
}