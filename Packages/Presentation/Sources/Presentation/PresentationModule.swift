import Domain
import Support

public enum PresentationModule {
    public static let dependencies = [
        DomainModule.name,
        SupportModule.name,
    ]
}
