import XCTest
@testable import WCrafter

class StatTests: XCTestCase {
    
    // Attributes
    var stat : StatTableViewController!
    
    //
    // XCTestCase Functions
    //
    override func setUp() {
        super.setUp()
        stat = StatTableViewController()
    }
    
    override func tearDown() {
        super.tearDown()
        stat = nil
    }
    
    //
    // Test Cases
    //
    func testDataTaskPresent() {
        let defaultSession = URLSession(configuration: .default)
        let url = NSURL(string: "http://www.iroseapps.com/moviles/stats.php")
        let request = URLRequest(url: url! as URL)
        
        stat.dataTask = defaultSession.dataTask(with: request)
        
        XCTAssert(stat.performLoading())
    }
    
    func testValidLogin() {
        XCTAssert(stat.performLoading())
    }
    
    func testInvalidResult() {
        let string = "card\n3G1F08\nodometerdelta\n13.4\nroad\n8465 KM\nbattery"
        let data = string.data(using: String.Encoding(rawValue: String.Encoding.ascii.rawValue))
        
        XCTAssert(!stat.sendResult(data: data!))
    }
    
    func testValidResult() {
        let string = "card\n3G1F08\nodometerdelta\n13.4\nroad\n8465 KM\nbattery\nRegular"
        let data = string.data(using: String.Encoding(rawValue: String.Encoding.ascii.rawValue))
        
        XCTAssert(stat.sendResult(data: data!))
    }
    
    func testEmptyPostType() {
        let type : String = ""
        let value : String = "3G1F08"
        
        guard Stat(type: type, value: value) != nil else {
            XCTAssert(true)
            return
        }
        XCTFail()
    }
    
    func testEmptyPostValue() {
        let type : String = "card"
        let value : String = ""
        
        guard Stat(type: type, value: value) != nil else {
            XCTAssert(true)
            return
        }
        XCTFail()
    }
    
    func testValidPost() {
        let type : String = "card"
        let value : String = "3G1F08"
        
        guard Stat(type: type, value: value) != nil else {
            XCTFail()
            return
        }
        XCTAssert(true)
    }
}
