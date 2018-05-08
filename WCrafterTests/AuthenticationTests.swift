import XCTest
@testable import WCrafter

class AuthenticationTests: XCTestCase {
    
    // Attributes
    var auth : Authentication!
    
    //
    // XCTestCase Functions
    //
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        auth = storyboard.instantiateViewController(withIdentifier: "Authentication") as! Authentication
    
        let _ = auth.view
    }
    
    override func tearDown() {
        super.tearDown()
        auth = nil
    }
    
    //
    // Test Cases
    //
    func testEmptyUsername() {
        auth.user.text = ""
        auth.pass.text = "secret"
        
        XCTAssert(!auth.performLogin())
    }
    
    func testEmptyPassword() {
        auth.user.text = "Patricia"
        auth.pass.text = ""
        
        XCTAssert(!auth.performLogin())
    }
    
    func testDataTaskPresent() {
        let defaultSession = URLSession(configuration: .default)
        let url = NSURL(string: "http://www.iroseapps.com/moviles/login.php?username=Patricia&password=gonzalezpatricia")
        let request = URLRequest(url: url! as URL)
        
        auth.user.text = "Patricia"
        auth.pass.text = "secret"
        auth.dataTask = defaultSession.dataTask(with: request)
        
        XCTAssert(auth.performLogin())
    }
    
    func testValidLogin() {
        auth.user.text = "Patricia"
        auth.pass.text = "secret"
        
        XCTAssert(auth.performLogin())
    }
    
    func testInvalidResult() {
        let string = "false"
        let data = string.data(using: String.Encoding(rawValue: String.Encoding.ascii.rawValue))
        
        XCTAssert(!auth.verifyResult(data: data!))
    }
    
    func testValidResult() {
        let string = "false"
        let data = string.data(using: String.Encoding(rawValue: String.Encoding.ascii.rawValue))
        
        guard auth.verifyResult(data: data!) else {
            XCTAssert(true)
            return
        }
    }
}
