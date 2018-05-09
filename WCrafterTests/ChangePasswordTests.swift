import XCTest
@testable import WCrafter

class ChangePasswordTests: XCTestCase {
    
    // Attributes
    var chan : ChangePassword!
    
    //
    // XCTestCase Functions
    //
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        chan = storyboard.instantiateViewController(withIdentifier: "ChangePassword") as! ChangePassword
        
        let _ = chan.view
    }
    
    override func tearDown() {
        super.tearDown()
        chan = nil
    }
    
    //
    // Test Cases
    //
    func testPasswordsNotSame() {
        chan.newPassword.text = "secret"
        chan.newPassword2.text = "letmein"
        
        XCTAssert(!chan.checkPasswords())
    }
    
    func testPasswordsSame() {
        chan.newPassword.text = "secret"
        chan.newPassword2.text = "secret"
        
        XCTAssert(chan.checkPasswords())
    }
    
    func testInvalidResult() {
        let string = "false"
        let data = string.data(using: String.Encoding(rawValue: String.Encoding.ascii.rawValue))
        
        XCTAssert(!chan.verifyResult(data: data!))
    }
    
    func testValidResult() {
        let string = "true"
        let data = string.data(using: String.Encoding(rawValue: String.Encoding.ascii.rawValue))
        
        XCTAssert(chan.verifyResult(data: data!))
    }

}
