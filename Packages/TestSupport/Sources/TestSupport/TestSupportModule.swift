import Domain
import Support

public enum TestSupportModule {
    public static let dependencies = [
        DomainModule.name,
        SupportModule.name,
    ]
}
