import Domain
import Support

public enum DataLayerModule {
    public static let dependencies = [
        DomainModule.name,
        SupportModule.name,
    ]
}
