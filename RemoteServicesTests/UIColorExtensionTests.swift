import XCTest
@testable import RemoteServices

class UIColorExtensionTests: XCTestCase {
    func testConvenienceIntHexInit() {
        let color = UIColor(hex: 0x111213)
        XCTAssertEqual(color, UIColor(red: 17/255, green: 18/255, blue: 19/255, alpha: 1))
    }
    
    func testConvenienceStringHexInit() {
        let color = UIColor(color: "0x111213")
        XCTAssertEqual(color, UIColor(red: 17/255, green: 18/255, blue: 19/255, alpha: 1))
    }
    
    func testConvenienceStringHexInitWrongValue() {
        let color = UIColor(color: "vdlna")
        XCTAssertEqual(color, UIColor(red: 0, green: 0, blue: 0, alpha: 1))
    }
}
