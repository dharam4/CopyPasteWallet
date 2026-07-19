# CopyPasteWallet

CopyPasteWallet is a native macOS utility for capturing, organizing, finding, and reusing frequently copied content. It is designed to act as a lightweight personal wallet for text snippets, links, commands, code, notes, templates, email addresses, and other values that need to be pasted repeatedly.

> [!NOTE]
> CopyPasteWallet is at an early stage of development. The current application is based on the initial SwiftUI and SwiftData Xcode template. The features described in the roadmap below are planned and are not yet complete.

## Product vision

The intended workflow is simple:

1. Open a compact floating console from anywhere on macOS.
2. Type, paste, or drag content into it.
3. Save the content as a reusable card.
4. Find it later through search and filters.
5. Copy it back to the clipboard with minimal interaction.

The application should remain fast, keyboard-friendly, native to macOS, and local-first.

## Planned core features

- A searchable library of reusable cards
- Capture of plain text, URLs, commands, code, notes, and templates
- A floating AppKit panel available above other applications
- Text and URL drag-and-drop support
- Automatic content classification and suggested titles
- List and grid library layouts
- Pinning, favorites, editing, copying, and deletion
- A configurable global keyboard shortcut
- Optional menu-bar access
- Local SwiftData persistence

## Privacy principles

CopyPasteWallet may hold sensitive clipboard content, so privacy is part of the product design:

- Card content stays on the Mac by default.
- Content is not uploaded to external services.
- Saved values are not included in analytics or logs.
- Automatic clipboard history is not part of the initial version.
- Any future synchronization must be opt-in and designed explicitly for security.

## Current implementation

The repository currently contains:

- A native macOS SwiftUI application
- A SwiftData model container
- The template `Item` model
- Basic item creation and deletion
- Unit-test and UI-test targets

The planned `StoredCard` domain model, library interface, and floating console have not yet replaced the template implementation.

## Technology

- Swift
- SwiftUI
- SwiftData
- AppKit for macOS-specific window behavior
- Xcode and Swift Package Manager
- XCTest

## Repository structure

```text
CopyPasteWallet/
├── CopyPasteWallet.xcworkspace
└── App/
    └── CopyPasteWallet/
        ├── CopyPasteWallet.xcodeproj
        ├── CopyPasteWallet/
        ├── CopyPasteWalletTests/
        └── CopyPasteWalletUITests/
```

The workspace is at the repository root, while the Xcode project and application sources are nested under `App/CopyPasteWallet`.

## Getting started

### Requirements

- macOS
- A recent version of Xcode with SwiftData support

### Open in Xcode

Clone the repository over SSH:

```bash
git clone git@github.com:dharam4/CopyPasteWallet.git
cd CopyPasteWallet
open CopyPasteWallet.xcworkspace
```

Select the `CopyPasteWallet` scheme and run the app from Xcode.

### Command-line build

Use the Xcode workspace rather than `swift build`, because the repository is an Xcode application and does not contain a root `Package.swift`:

```bash
xcodebuild \
  -workspace CopyPasteWallet.xcworkspace \
  -scheme CopyPasteWallet \
  -configuration Debug \
  -destination 'platform=macOS' \
  CODE_SIGNING_ALLOWED=NO \
  build
```

## Development workflow

- `main` contains stable, reviewed work.
- `develop` is the integration branch for ongoing development.
- `tech/*` branches are local working branches and should not be pushed directly unless explicitly requested.

Keep changes small and reviewable. Inspect existing types before adding new models or services, preserve SwiftData compatibility, and run an Xcode build after meaningful changes.

## Roadmap

1. Verify and document the Xcode workspace, schemes, targets, and build.
2. Replace the template model with a carefully designed `StoredCard` model.
3. Build the searchable library and card editor.
4. Implement and retain the floating-console controller.
5. Add reliable text and URL capture with SwiftData persistence.
6. Add global shortcut and menu-bar integration.
7. Add focused tests for positioning, search, title generation, and classification.
8. Add SwiftLint and an `xcodebuild`-based CI workflow.

## Initial non-goals

- Cloud synchronization
- Team collaboration or shared libraries
- Browser extensions
- Automatic storage of every clipboard entry
- AI summarization or remote metadata extraction
- Cross-platform and iOS clients

The first release should focus on excellent capture, storage, search, editing, and reuse on macOS.

## License

No license has been selected yet. Until a license is added, all rights are reserved.
