import XCTest
@testable import RemoteServices

class ItemsServiceTests: XCTestCase {
    
    func testItemService() {
        let expectation = expectationWithDescription("Item API")
        
        ItemsService().items { response in
            if response.count > 0 && response[0] == "Twitter" {
                expectation.fulfill()
            }
        }
        
        waitForExpectationsWithTimeout(10, handler: nil)
    }
}
