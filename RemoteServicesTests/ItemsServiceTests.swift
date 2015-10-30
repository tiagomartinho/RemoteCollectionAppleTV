import XCTest
@testable import RemoteServices

import OHHTTPStubs

class ItemsServiceTests: XCTestCase {
    
    override func tearDown() {
        super.tearDown()
        OHHTTPStubs.removeAllStubs()
    }
    
    func testItemService() {
        let expectation = expectationWithDescription("Item API")
        
        stub(isHost(ServiceApi.hostURL)) { _ in
            let stubPath = OHPathForFile("ItemsResponse.json", self.dynamicType)
            return fixture(stubPath!, headers: ["Content-Type":"application/json"])
        }
        
        ItemsService().items { response in
            if response.count > 0 && response[0].id == 1 && response[0].name == "Twitter" && response[0].color == "0x55ADEF" && response[0].icon == "https://pbs.twimg.com/profile_images/615680132565504000/EIpgSD2K.png" {
                expectation.fulfill()
            }
            else {
                XCTFail()
                expectation.fulfill()
            }
        }
        
        waitForExpectationsWithTimeout(10, handler: nil)
    }
}