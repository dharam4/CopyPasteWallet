# Local Swift packages

CopyPasteWallet uses local Swift packages to enforce feature boundaries.

## Dependency direction

```text
Presentation ──┐
               ├──> Domain
DataLayer ─────┤
               └──> Support
TestSupport ───┘
```

- **Domain** contains business entities, value types, use-case protocols, and domain rules. It must not depend on UI or persistence frameworks.
- **Presentation** contains presentation state and reusable SwiftUI features. It can depend on Domain and Support, but not DataLayer.
- **DataLayer** contains persistence implementations, mapping, and external data access. It implements contracts defined by Domain.
- **Support** contains small, domain-agnostic utilities shared across production modules.
- **TestSupport** contains reusable fixtures, spies, stubs, and test builders. Production targets must never depend on it.

Each package targets macOS 14 and owns its tests. Tests should follow Arrange–Act–Assert.
