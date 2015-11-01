public struct Item {
    let id:Int
    let name:String
    let color:String
    let icon:String
}

extension Item: Equatable {}

public func ==(lhs: Item, rhs: Item) -> Bool {
    return lhs.id == rhs.id && lhs.name == rhs.name && lhs.color == rhs.color && lhs.icon == rhs.icon
}