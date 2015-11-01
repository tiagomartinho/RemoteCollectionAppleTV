@testable import RemoteServices

import Quick
import Nimble
import OHHTTPStubs

class ItemsServiceSpec: QuickSpec {
    
    var items:[Item]?
    
    override func spec() {
        describe("the Items Service") {
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
                    let item = Item(id: 1, name: "Twitter", color: "0x55ADEF", icon: "https://pbs.twimg.com/profile_images/615680132565504000/EIpgSD2K.png")
                    expect(self.items?.first).toEventually(equal(item))
                }
                
                context("when the response is incorrect") {
                    beforeEach {
                        stub(isHost(ServiceApi.hostURL)) { _ in
                            let stubPath = OHPathForFile("ItemsReponseError.json", self.dynamicType)
                            return fixture(stubPath!, status: 500, headers: ["Content-Type":"application/json"])
                        }
                    }
                    it("has empty items list") {
                        ItemsService().items { response in
                            self.items = response
                        }
                        expect(self.items).toEventually(beEmpty())
                    }
                }
            }
        }
    }
}