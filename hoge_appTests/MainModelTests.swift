import XCTest
@testable import hoge_app

class MainModelTests:XCTestCase {
    let subject2 = MainViewController()
    
    func test_doubleUp() {
        let subject = MainModel()
        XCTAssertTrue(subject.count == 1)
        
        subject.doubleUp()
        
        XCTAssertTrue(subject.count == 2)
        
        subject.doubleUp()
        
        XCTAssertTrue(subject.count == 4)
        
        subject2.loadViewIfNeeded()
        print(subject2.countText.text)
        XCTAssertTrue(subject2.countText.text == "1")
        let hoge = UIButton()
        subject2.tappedDoubleUp(hoge)
        XCTAssertTrue(subject2.countText.text == "2")
        
    }
}
