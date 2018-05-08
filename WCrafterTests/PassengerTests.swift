import XCTest
@testable import WCrafter

class PassengerTests: XCTestCase {
    
    // Attributes
    var pass : Passenger!
    
    //
    // XCTestCase Functions
    //
    override func setUp() {
        super.setUp()
        pass = Passenger()
    }
    
    override func tearDown() {
        super.tearDown()
        pass = nil
    }
    
    //
    // Test Cases
    //
    func testDecreaseAtLowBoundary() {
        pass.cont = 0
        
        XCTAssert(!pass.canDecrease())
    }
    
    func testDecreaseWithinBoundary() {
        pass.cont = 10
        
        XCTAssert(pass.canDecrease())
    }
    
    func testIncreaseAtHighBoundary() {
        pass.cont = 20
        
        XCTAssert(!pass.canIncrease())
    }
    
    func testIncreaseWithinBoundary() {
        pass.cont = 10
        
        XCTAssert(pass.canIncrease())
    }
}
