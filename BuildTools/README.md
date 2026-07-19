# Local code-quality tools

SwiftLint and SwiftFormat are pinned through `BuildTools/Package.swift` and run only from local scripts:

```bash
Scripts/format.sh
Scripts/lint.sh
Scripts/quality.sh
```

- `format.sh` updates application and package Swift sources in place.
- `lint.sh` runs SwiftLint in strict mode.
- `quality.sh` checks formatting without changing files, then runs strict linting.

The scripts exit without running when `CI=true` or `GITHUB_ACTIONS=true`. The GitHub Actions workflow intentionally does not call them.
