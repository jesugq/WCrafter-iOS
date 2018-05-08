import XCTest
@testable import WCrafter

class ProfileTests: XCTestCase {
    
    // Attributes
    var prof : Profile!
    
    //
    // XCTestCase Functions
    //
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        prof = storyboard.instantiateViewController(withIdentifier: "Profile") as! Profile
        
        let _ = prof.view
    }
    
    override func tearDown() {
        super.tearDown()
        prof = nil
    }

    //
    // Test Cases
    //
    func testImagePickerAvailable(){
        XCTAssert(prof.callPickerController())
    }
    
    func testInvalidResult() {
        let string = "Patricia"
        let data = string.data(using: String.Encoding(rawValue: String.Encoding.ascii.rawValue))
        
        XCTAssert(!prof.verifyResult(data: data!))
    }
    
    func testValidResult() {
        let string = "Patricia Gonzalez\n4.5"
        let data = string.data(using: String.Encoding(rawValue: String.Encoding.ascii.rawValue))
        
        XCTAssert(prof.verifyResult(data: data!))
    }
}
