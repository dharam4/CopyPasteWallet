@testable import Support
import XCTest

final class DependencyTests: XCTestCase {
    override func setUp() {
        super.setUp()
        Dependency.reset()
    }

    override func tearDown() {
        Dependency.reset()
        super.tearDown()
    }

    func testResolveReturnsRegisteredDependency() {
        // Arrange
        let expectedRepository = DemoRepositoryImplementation()
        Dependency.register(DemoRepository.self) { expectedRepository }

        // Act
        let repository: any DemoRepository = Dependency.resolve()

        // Assert
        XCTAssertTrue(repository === expectedRepository)
    }

    func testResolveConstructsDependencyWithRuntimeArgument() {
        // Arrange
        let expectedRepository = DemoRepositoryImplementation()
        Dependency.register(DemoRepository.self) { expectedRepository }
        Dependency.register(DemoUseCase.self) {
            DemoUseCaseImplementation(repository: Dependency.resolve(), anyArg: $0)
        }

        // Act
        let useCase: any DemoUseCase = Dependency.resolve(arg1: "value")

        // Assert
        XCTAssertTrue(useCase.repository === expectedRepository)
        XCTAssertEqual(useCase.anyArg, "value")
    }

    func testResolveConstructsDependencyWithMultipleRuntimeArguments() {
        // Arrange
        Dependency.register(ConfiguredService.self) {
            ConfiguredServiceImplementation(name: $0, retryCount: $1, isEnabled: $2)
        }

        // Act
        let service: any ConfiguredService = Dependency.resolve(
            arg1: "wallet",
            arg2: 3,
            arg3: true
        )

        // Assert
        XCTAssertEqual(service.name, "wallet")
        XCTAssertEqual(service.retryCount, 3)
        XCTAssertTrue(service.isEnabled)
    }

    func testResolveConstructsDependencyWithFiveRuntimeArguments() {
        // Arrange
        Dependency.register(FiveArgumentService.self) {
            FiveArgumentService(
                first: $0,
                second: $1,
                third: $2,
                fourth: $3,
                fifth: $4
            )
        }

        // Act
        let service: FiveArgumentService = Dependency.resolve(
            arg1: "one",
            arg2: 2,
            arg3: true,
            arg4: 4.0,
            arg5: "five"
        )

        // Assert
        XCTAssertEqual(service.first, "one")
        XCTAssertEqual(service.second, 2)
        XCTAssertTrue(service.third)
        XCTAssertEqual(service.fourth, 4.0)
        XCTAssertEqual(service.fifth, "five")
    }

    func testRegisterSupportsFluentChaining() {
        // Arrange
        let repository = DemoRepositoryImplementation()
        Dependency
            .register(DemoRepository.self) { repository }
            .register(ConfiguredService.self) {
                ConfiguredServiceImplementation(name: "wallet", retryCount: 3, isEnabled: true)
            }
            .register(DemoUseCase.self) {
                DemoUseCaseImplementation(repository: Dependency.resolve(), anyArg: "value")
            }

        // Act
        let resolvedRepository: any DemoRepository = Dependency.resolve()
        let configuredService: any ConfiguredService = Dependency.resolve()
        let useCase: any DemoUseCase = Dependency.resolve()

        // Assert
        XCTAssertTrue(resolvedRepository === repository)
        XCTAssertEqual(configuredService.name, "wallet")
        XCTAssertTrue(useCase.repository === repository)
    }

    func testRegisterReplacesExistingFactory() {
        // Arrange
        let firstRepository = DemoRepositoryImplementation()
        let replacementRepository = DemoRepositoryImplementation()
        Dependency.register(DemoRepository.self) { firstRepository }

        // Act
        Dependency.register(DemoRepository.self) { replacementRepository }
        let repository: any DemoRepository = Dependency.resolve()

        // Assert
        XCTAssertTrue(repository === replacementRepository)
    }
}

private protocol DemoRepository: AnyObject {}

private final class DemoRepositoryImplementation: DemoRepository {}

private protocol DemoUseCase {
    var repository: any DemoRepository { get }
    var anyArg: String { get }
}

private struct DemoUseCaseImplementation: DemoUseCase {
    let repository: any DemoRepository
    let anyArg: String
}

private protocol ConfiguredService {
    var name: String { get }
    var retryCount: Int { get }
    var isEnabled: Bool { get }
}

private struct ConfiguredServiceImplementation: ConfiguredService {
    let name: String
    let retryCount: Int
    let isEnabled: Bool
}

private struct FiveArgumentService {
    let first: String
    let second: Int
    let third: Bool
    let fourth: Double
    let fifth: String
}
