@testable import DataLayer
import XCTest

final class DataLayerModuleTests: XCTestCase {
    func testDependenciesPointInward() {
        // Arrange
        let expectedDependencies = ["Domain", "Support"]

        // Act
        let dependencies = DataLayerModule.dependencies

        // Assert
        XCTAssertEqual(dependencies, expectedDependencies)
    }
}
