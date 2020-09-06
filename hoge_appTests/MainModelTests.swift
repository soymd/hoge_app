import XCTest
@testable import hoge_app

class MainModelTests:XCTestCase {
    
    func test_doubleUp() {
        var subject = MainModel()
        XCTAssertTrue(subject.count == 1)
        
        subject.doubleUp()
        
        XCTAssertTrue(subject.count == 2)
        
        subject.doubleUp()
        
        XCTAssertTrue(subject.count == 4)
               
    }
}
