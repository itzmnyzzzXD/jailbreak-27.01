# Jailbreak 27.0.1

A SwiftUI starter app and GitHub Actions pipeline for producing an unsigned iOS IPA artifact.

## Important status

This repository was initially empty. It does **not** contain an iOS 27.0.1 exploit chain, a kernel exploit, a bootrom exploit, a code-signing bypass, or a jailbreak implementation. The app is an informational status dashboard and does not jailbreak a device. A successful Xcode build only proves that the app compiled; it is not evidence of a working jailbreak.

## Build an IPA artifact

The workflow at `.github/workflows/build-ipa.yml` runs on pushes to `main` that touch the app/project/workflow files, and can also be started manually:

1. Open the repository's **Actions** tab.
2. Select **Build iOS IPA artifact**.
3. Choose **Run workflow** and run it on `main`.
4. Open the completed run and download the `Jailbreak-27.0.1-IPA` artifact.

The artifact contains:

- `Jailbreak-27.0.1-unsigned.ipa`
- `Jailbreak-27.0.1-unsigned.ipa.sha256`

The workflow uses a macOS GitHub-hosted runner, Xcode, and XcodeGen. It generates the Xcode project from `project.yml`, builds for generic iOS devices with code signing disabled, packages the app into `Payload/Jailbreak2701.app`, and validates the ZIP container.

## Installing the artifact

The IPA produced by this workflow is **unsigned**. Standard iOS installation requires a valid signature and provisioning profile. Use a legitimate sideloading process that signs the app for your device; do not expect the raw artifact to install directly from Files or Safari. The app does not require or request jailbreak privileges.

## Local build

On a Mac with Xcode and XcodeGen installed:

```sh
brew install xcodegen
xcodegen generate --spec project.yml
xcodebuild \
  -project Jailbreak2701.xcodeproj \
  -scheme Jailbreak2701 \
  -configuration Release \
  -sdk iphoneos \
  -destination 'generic/platform=iOS' \
  -derivedDataPath build \
  CODE_SIGNING_ALLOWED=NO build
```

## Compatibility

The app targets iOS 15.0 and later as a normal sandboxed SwiftUI app. That is the app's deployment target, not jailbreak compatibility. A real jailbreak requires public, verified exploit code and testing on the exact device and build.
