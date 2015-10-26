import XCTest
@testable import RemoteServices

class RemoteServicesTests: XCTestCase {
    func testExample() {
      XCTAssertEqual(RemoteServices().test("hello"),"hello")
    }
}
