import XCTest
@testable import WCrafter

class CommentTests: XCTestCase {
    
    // Attributes
    var comm : CommentTableViewController!
    
    //
    // XCTestCase Functions
    //
    override func setUp() {
        super.setUp()
        comm = CommentTableViewController()
    }
    
    override func tearDown() {
        super.tearDown()
        comm = nil
    }
    
    //
    // Test Cases
    //
    func testDataTaskPresent() {
        let defaultSession = URLSession(configuration: .default)
        let url = NSURL(string: "http://www.iroseapps.com/moviles/comments.php?username=Patricia")
        let request = URLRequest(url: url! as URL)
        
        comm.dataTask = defaultSession.dataTask(with: request)
        
        XCTAssert(comm.performLoading())
    }
    
    func testValidLogin() {
        XCTAssert(comm.performLoading())
    }
    
    func testInvalidResult() {
        let string = "Fer\n4.5\nMuy bien.\nChucho"
        let data = string.data(using: String.Encoding(rawValue: String.Encoding.ascii.rawValue))
        
        XCTAssert(!comm.sendResult(data: data!))
    }
    
    func testValidResult() {
        let string = "Fer\n4.5\nMuy bien.\nChucho\n5\nNice."
        let data = string.data(using: String.Encoding(rawValue: String.Encoding.ascii.rawValue))
        
        XCTAssert(comm.sendResult(data: data!))
    }
    
    func testEmptyCommentUser() {
        let user : String = ""
        let ratio : String = "4.5"
        let comment : String = "Muy bien."
        
        guard Comment(user: user, ratio: ratio, comment: comment) != nil else {
            XCTAssert(true)
            return
        }
        XCTFail()
    }
    
    func testEmptyCommentRatio() {
        let user : String = "Fer"
        let ratio : String = ""
        let comment : String = "Muy bien."
        
        guard Comment(user: user, ratio: ratio, comment: comment) != nil else {
            XCTAssert(true)
            return
        }
        XCTFail()
    }
    
    func testEmptyCommentComment() {
        let user : String = "Fer"
        let ratio : String = "4.5"
        let comment : String = ""
        
        guard Comment(user: user, ratio: ratio, comment: comment) != nil else {
            XCTFail()
            return
        }
        XCTAssert(true)
    }
    
    func testValidComment() {
        let user : String = "Fer"
        let ratio : String = "4.5"
        let comment : String = "Muy bien."
        
        guard Comment(user: user, ratio: ratio, comment: comment) != nil else {
            XCTFail()
            return
        }
        XCTAssert(true)
    }
}
