import UIKit

public struct Item {
    public let id:Int
    public let name:String
    public let color:UIColor
    public let icon:String
}

extension Item: Equatable {}

public func ==(lhs: Item, rhs: Item) -> Bool {
    return lhs.id == rhs.id && lhs.name == rhs.name && lhs.color == rhs.color && lhs.icon == rhs.icon
}