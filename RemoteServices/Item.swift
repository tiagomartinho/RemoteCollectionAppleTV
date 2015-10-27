import Foundation
import SwiftyJSON

public struct Item {
    let id:Int
    let name:String
    let color:String
    let icon:String
}

extension Item {
    init(json:JSON){
        self.id = json["id"].int ?? 0
        self.name = json["name"].string ?? ""
        self.color = json["color"].string ?? ""
        self.icon = json["icon"].string ?? ""
    }
}