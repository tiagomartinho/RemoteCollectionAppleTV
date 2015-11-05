@testable import RemoteServices

import Quick
import Nimble
import OHHTTPStubs

class ItemsServiceSpec: QuickSpec {
    
    var items:[Item]?

    override func spec() {
        describe("the Items Service") {
            context("when the response is incorrect") {
                beforeEach {
                    stub(isHost(ServiceApi.hostURL)) { _ in
                        return fixture("", status: 500, headers: ["Content-Type":"application/json"])
                    }
                }
                it("has empty items list") {
                    ItemsService().items { response in
                        self.items = response
                    }
                    expect(self.items).toEventually(beEmpty())
                }
            }
            
            context("when the response is correct") {
                beforeEach {
                    stub(isHost(ServiceApi.hostURL)) { _ in
                        let stubPath = OHPathForFile("ItemsResponse.json", self.dynamicType)
                        return fixture(stubPath!, headers: ["Content-Type":"application/json"])
                    }
                }
                it("has not empty items list") {
                    ItemsService().items { response in
                        self.items = response
                    }
                    expect(self.items).toEventuallyNot(beEmpty())
                }
                it("contains the correct item information") {
                    ItemsService().items { response in
                        self.items = response
                    }
                    let item = Item(id: 4, name: "Pinterest", color: UIColor(red: 221/255, green: 81/255, blue: 69/255, alpha: 1), icon: "https://business.pinterest.com/sites/business/files/bg-basics-badge-02.jpg")
                    expect(self.items?[3]).toEventually(equal(item))
                }
            }
        }
    }
}