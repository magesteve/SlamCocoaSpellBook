import XCTest
@testable import SlamCocoaSpellBook

final class SlamCocoaSpellBookTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SlamCocoaSpellBook().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
