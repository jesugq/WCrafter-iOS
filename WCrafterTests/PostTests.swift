import XCTest
@testable import WCrafter

class PostTests: XCTestCase {
    
    // Attributes
    var cont : PostTableViewController!
    
    //
    // XCTestCase Functions
    //
    override func setUp() {
        super.setUp()
        cont = PostTableViewController()
    }
    
    override func tearDown() {
        super.tearDown()
        cont = nil
    }
    
    //
    // Test Cases
    //
    func testDataTaskPresent() {
        let defaultSession = URLSession(configuration: .default)
        let url = NSURL(string: "http://www.iroseapps.com/moviles/notifications.php")
        let request = URLRequest(url: url! as URL)
        
        cont.dataTask = defaultSession.dataTask(with: request)
        
        XCTAssert(cont.performLoading())
    }
    
    func testValidLoadingNotifications() {
        cont.typeGiven = "Notificacions"
        
        XCTAssert(cont.performLoading())
    }
    
    func testValidLoadingAlerts() {
        cont.typeGiven = "Alerts"
        
        XCTAssert(cont.performLoading())
    }
    
    func testInvalidResult() {
        let string = "Falla de Motor\nXYZ-781\nSobrecalentamiento"
        let data = string.data(using: String.Encoding(rawValue: String.Encoding.ascii.rawValue))
        
        XCTAssert(!cont.sendResult(data: data!))
    }
    
    func testValidResult() {
        let string = "Falla de Motor\nXYZ-781\nSobrecalentamiento\nSBC-681"
        let data = string.data(using: String.Encoding(rawValue: String.Encoding.ascii.rawValue))
        
        XCTAssert(cont.sendResult(data: data!))
    }
    
    func testEmptyPostDescription() {
        let desc : String = ""
        let code : String = "XYZ-781"
        
        guard Post(desc: desc, code: code) != nil else {
            XCTAssert(true)
            return
        }
        XCTFail()
    }
    
    func testEmptyPostCode() {
        let desc : String = "Falla de Motor"
        let code : String = ""
        
        guard Post(desc: desc, code: code) != nil else {
            XCTAssert(true)
            return
        }
        XCTFail()
    }
    
    func testValidPost() {
        let desc : String = "Falla de Motor"
        let code : String = "XYZ-781"
        
        guard Post(desc: desc, code: code) != nil else {
            XCTFail()
            return
        }
        XCTAssert(true)
    }
}
