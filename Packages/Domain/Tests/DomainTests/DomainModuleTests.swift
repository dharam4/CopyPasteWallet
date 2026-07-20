@testable import Domain
import XCTest

final class DomainModuleTests: XCTestCase {
    func testNameIdentifiesDomainModule() {
        // Arrange
        let expectedName = "Domain"

        // Act
        let name = DomainModule.name

        // Assert
        XCTAssertEqual(name, expectedName)
    }
}
