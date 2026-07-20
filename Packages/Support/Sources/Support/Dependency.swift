import Foundation

/// A process-wide registry for constructing application dependencies.
public enum Dependency {
    private static let registry = DependencyRegistry()

    /// Registers a factory with any number of runtime arguments.
    @discardableResult
    public static func register<Service, each Argument>(
        _ type: Service.Type = Service.self,
        factory: @escaping (repeat each Argument) -> Service
    ) -> Dependency.Type {
        let dependencyFactory = DependencyFactory<Service, repeat each Argument>(
            build: factory
        )
        registry.store(dependencyFactory, for: type)
        return Dependency.self
    }

    /// Resolves a dependency registered without runtime arguments.
    public static func resolve<Service>(
        _ type: Service.Type = Service.self
    ) -> Service {
        build(type)
    }

    /// Resolves a dependency registered with one runtime argument.
    public static func resolve<Service, Arg1>(
        _ type: Service.Type = Service.self,
        arg1: Arg1
    ) -> Service {
        build(type, arguments: arg1)
    }

    /// Resolves a dependency registered with two runtime arguments.
    public static func resolve<Service, Arg1, Arg2>(
        _ type: Service.Type = Service.self,
        arg1: Arg1,
        arg2: Arg2
    ) -> Service {
        build(type, arguments: arg1, arg2)
    }

    /// Resolves a dependency registered with three runtime arguments.
    public static func resolve<Service, Arg1, Arg2, Arg3>(
        _ type: Service.Type = Service.self,
        arg1: Arg1,
        arg2: Arg2,
        arg3: Arg3
    ) -> Service {
        build(type, arguments: arg1, arg2, arg3)
    }

    /// Resolves a dependency registered with four runtime arguments.
    public static func resolve<Service, Arg1, Arg2, Arg3, Arg4>(
        _ type: Service.Type = Service.self,
        arg1: Arg1,
        arg2: Arg2,
        arg3: Arg3,
        arg4: Arg4
    ) -> Service {
        build(type, arguments: arg1, arg2, arg3, arg4)
    }

    /// Resolves a dependency registered with five runtime arguments.
    public static func resolve<Service, Arg1, Arg2, Arg3, Arg4, Arg5>(
        _ type: Service.Type = Service.self,
        arg1: Arg1,
        arg2: Arg2,
        arg3: Arg3,
        arg4: Arg4,
        arg5: Arg5
    ) -> Service {
        build(type, arguments: arg1, arg2, arg3, arg4, arg5)
    }

    /// Resolves a dependency with one runtime argument.
    ///
    /// This overload preserves the original singular `argument` API.
    public static func resolve<Service, Argument>(
        _ type: Service.Type = Service.self,
        argument: Argument
    ) -> Service {
        resolve(type, arg1: argument)
    }

    static func reset() {
        registry.removeAll()
    }

    private static func build<Service, each Argument>(
        _ type: Service.Type,
        arguments: repeat each Argument
    ) -> Service {
        guard let factory = registry.factory(for: type) else {
            preconditionFailure("No dependency registered for \(String(reflecting: type)).")
        }

        guard let typedFactory = factory as? DependencyFactory<Service, repeat each Argument> else {
            preconditionFailure(
                "Dependency \(String(reflecting: type)) was registered with different arguments."
            )
        }

        return typedFactory.build(repeat each arguments)
    }
}

private struct DependencyFactory<Service, each Argument> {
    let build: (repeat each Argument) -> Service
}

private final class DependencyRegistry: @unchecked Sendable {
    private var factories: [ObjectIdentifier: Any] = [:]
    private let lock = NSLock()

    func store<Service>(_ factory: Any, for type: Service.Type) {
        lock.withLock {
            factories[ObjectIdentifier(type)] = factory
        }
    }

    func factory<Service>(for type: Service.Type) -> Any? {
        lock.withLock {
            factories[ObjectIdentifier(type)]
        }
    }

    func removeAll() {
        lock.withLock {
            factories.removeAll()
        }
    }
}
