import XCTest
@testable import WCrafter

class CrafterTests: XCTestCase {
    
    // Attributes
    var cont : CrafterTableViewController!
    
    //
    // XCTestCase Functions
    //
    override func setUp() {
        super.setUp()
        cont = CrafterTableViewController()
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
        let url = NSURL(string: "http://www.iroseapps.com/moviles/crafters.php")
        let request = URLRequest(url: url! as URL)
        
        cont.dataTask = defaultSession.dataTask(with: request)
        
        XCTAssert(cont.performLoading())
    }
    
    func testValidLoading() {
        XCTAssert(cont.performLoading())
    }
    
    func testInvalidResult() {
        let string = "crafter1\nUSA-03-64\ncrafter2\nIYO-23-81\ncrafter3\nNIL-76-21\ncrafter4\nINS-78-23\ncrafter5"
        let data = string.data(using: String.Encoding(rawValue: String.Encoding.ascii.rawValue))
        
        XCTAssert(!cont.sendResult(data: data!))
    }
    
    func testValidResult() {
        let string = "crafter1\nUSA-03-64\ncrafter2\nIYO-23-81\ncrafter3\nNIL-76-21\ncrafter4\nINS-78-23\ncrafter5\nNEW-71-92"
        let data = string.data(using: String.Encoding(rawValue: String.Encoding.ascii.rawValue))
        
        XCTAssert(cont.sendResult(data: data!))
    }
    
    func testEmptyCrafterImage() {
        let image : String = ""
        let plate : String = "USA-03-64"
        
        guard Crafter(image: image, plate: plate) != nil else {
            XCTAssert(true)
            return
        }
        XCTFail()
    }
    
    func testEmptyCrafterPlate() {
        let image : String = "crafter1"
        let plate : String = ""
        
        guard Crafter(image: image, plate: plate) != nil else {
            XCTAssert(true)
            return
        }
        XCTFail()
    }
    
    func testUnknownCrafterImage() {
        let image : String = "papas"
        let plate : String = "USA-03-64"
        
        guard Crafter(image: image, plate: plate) != nil else {
            XCTFail()
            return
        }
        XCTAssert(true)
    }
    
    func testValidCrafter() {
        let image : String = "crafter1"
        let plate : String = "USA-03-64"
        
        guard Crafter(image: image, plate: plate) != nil else {
            XCTFail()
            return
        }
        XCTAssert(true)
    }
}

