@testable import Presentation
import XCTest

final class PresentationModuleTests: XCTestCase {
    func testDependenciesPointInward() {
        // Arrange
        let expectedDependencies = ["Domain", "Support"]

        // Act
        let dependencies = PresentationModule.dependencies

        // Assert
        XCTAssertEqual(dependencies, expectedDependencies)
    }
}
