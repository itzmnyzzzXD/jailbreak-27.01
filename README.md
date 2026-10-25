# iPadOS 27.0.1 jailbreak research

This repository does **not** currently contain a working jailbreak for iPad (10th generation) / iPadOS 27.0.1.

## Research result

I reviewed the leading public iOS 27 projects and their stated support. The genuine Liter8/usbliter8 work targets specific A12/A13 devices and firmware workflows; palera1n targets A8–A11; Dopamine's published matrix does not include this target; and the Chollima iOS 27.0.1 demonstration has no public reproducible exploit source or verified A14 iPad installation path in the sources reviewed.

The source-by-source findings, hardware reasoning and evidence requirements are in [docs/PUBLIC-JAILBREAK-RESEARCH.md](docs/PUBLIC-JAILBREAK-RESEARCH.md).

## Why there is no IPA release

The prior IPA build was only an informational SwiftUI app. It read ordinary device metadata and contained no exploit. Its successful CI build did not constitute a jailbreak. The placeholder app and its IPA build workflow are being removed so this repository does not generate or present that UI as a jailbreak.

A real port requires a compatible exploit chain, A14-specific mitigation bypasses, exact iPadOS 27.0.1 firmware patching, and device-level boot/bootstrap validation. Copying an A13 profile, adjusting a few offsets or making another app button cannot provide those primitives.

## Status

**No compatible public jailbreak implementation found for this exact target.** This says what the public evidence supports; it does not prove that private research is impossible. If a compatible public source or reproducible exploit release appears, it can be evaluated against the target device and firmware before integration.

## Sources

- [Xplo8E/Liter8](https://github.com/Xplo8E/Liter8)
- [wh1te4ever/usbliter8-fun](https://github.com/wh1te4ever/usbliter8-fun)
- [opa334/Dopamine](https://github.com/opa334/Dopamine)
- [palera1n](https://github.com/palera1n/palera1n)
- [Serotonin](https://github.com/SerotoninApp/Serotonin)
- [Calif / Chollima research](https://blog.calif.io/p/iphone)
- [Apple iPad (10th generation) specifications](https://support.apple.com/en-us/111840)