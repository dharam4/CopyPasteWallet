@testable import TestSupport
import XCTest

final class TestSupportModuleTests: XCTestCase {
    func testDependenciesAreAvailableToTestHelpers() {
        // Arrange
        let expectedDependencies = ["Domain", "Support"]

        // Act
        let dependencies = TestSupportModule.dependencies

        // Assert
        XCTAssertEqual(dependencies, expectedDependencies)
    }
}
