@testable import Support
import XCTest

final class SupportModuleTests: XCTestCase {
    func testNameIdentifiesSupportModule() {
        // Arrange
        let expectedName = "Support"

        // Act
        let name = SupportModule.name

        // Assert
        XCTAssertEqual(name, expectedName)
    }
}
