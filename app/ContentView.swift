import SwiftUI
import UIKit

struct ContentView: View {
    @State private var checked = false
    @State private var report = "No device check has been run."
    @State private var showBuildInfo = false

    private let accent = Color(red: 0.42, green: 0.48, blue: 1.0)
    private let background = Color(red: 0.025, green: 0.03, blue: 0.055)

    private var osVersion: String {
        UIDevice.current.systemVersion
    }

    var body: some View {
        ZStack {
            background.ignoresSafeArea()

            LinearGradient(
                colors: [
                    Color(red: 0.12, green: 0.13, blue: 0.30).opacity(0.72),
                    background.opacity(0.10),
                    Color(red: 0.10, green: 0.05, blue: 0.20).opacity(0.45)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 22) {
                    header

                    VStack(alignment: .leading, spacing: 13) {
                        HStack(spacing: 8) {
                            Image(systemName: "shield.lefthalf.filled")
                                .font(.system(size: 13, weight: .semibold))
                            Text("EXPLOIT STATUS")
                                .font(.system(size: 11, weight: .bold, design: .rounded))
                                .tracking(1.6)
                            Spacer()
                            Circle()
                                .fill(Color.orange)
                                .frame(width: 7, height: 7)
                            Text("NOT INCLUDED")
                                .font(.system(size: 10, weight: .bold, design: .rounded))
                                .tracking(0.7)
                        }
                        .foregroundStyle(.white.opacity(0.75))

                        Text("No exploit payload bundled")
                            .font(.system(size: 23, weight: .bold, design: .rounded))
                            .foregroundStyle(.white)

                        Text("This repository currently builds a status app only. Installing this IPA will not jailbreak iPadOS, grant root access, disable code signing, or install a package manager.")
                            .font(.system(size: 14))
                            .foregroundStyle(.white.opacity(0.68))
                            .lineSpacing(4)
                    }
                    .padding(20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.white.opacity(0.055))
                    .overlay(
                        RoundedRectangle(cornerRadius: 22, style: .continuous)
                            .stroke(.white.opacity(0.10), lineWidth: 1)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))

                    VStack(alignment: .leading, spacing: 15) {
                        sectionTitle("DEVICE CHECK", icon: "ipad")

                        infoRow("Device family", value: UIDevice.current.model)
                        infoRow("System version", value: osVersion)
                        infoRow("System name", value: UIDevice.current.systemName)

                        Button {
                            checked = true
                            report = "Detected \(UIDevice.current.systemName) \(UIDevice.current.systemVersion). This is an informational check only; no exploit was run and no system changes were made."
                        } label: {
                            HStack(spacing: 9) {
                                Image(systemName: "checkmark.shield")
                                Text(checked ? "Run check again" : "Check this device")
                                Spacer()
                                Image(systemName: "arrow.right")
                            }
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundStyle(.white)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 14)
                            .background(
                                LinearGradient(
                                    colors: [accent, Color(red: 0.35, green: 0.28, blue: 0.78)],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                        }
                        .buttonStyle(.plain)

                        if checked {
                            Text(report)
                                .font(.system(size: 12))
                                .foregroundStyle(.white.opacity(0.65))
                                .lineSpacing(3)
                                .padding(.top, 2)
                        }
                    }
                    .padding(20)
                    .background(.white.opacity(0.04))
                    .overlay(
                        RoundedRectangle(cornerRadius: 22, style: .continuous)
                            .stroke(.white.opacity(0.08), lineWidth: 1)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))

                    VStack(alignment: .leading, spacing: 12) {
                        sectionTitle("BUILD DETAILS", icon: "hammer")

                        detailLine("App", "Jailbreak 27.0.1")
                        detailLine("Bundle ID", "com.itzmnyzzz.jailbreak2701")
                        detailLine("Artifact", "Unsigned IPA")
                        detailLine("Install", "Requires signing before normal iOS installation")

                        Button {
                            showBuildInfo = true
                        } label: {
                            HStack {
                                Image(systemName: "info.circle")
                                Text("What this build can and cannot do")
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .font(.system(size: 12, weight: .semibold))
                            }
                            .font(.system(size: 13, weight: .medium))
                            .foregroundStyle(accent.opacity(0.95))
                            .padding(.top, 5)
                        }
                        .buttonStyle(.plain)
                    }
                    .padding(20)
                    .background(.white.opacity(0.04))
                    .overlay(
                        RoundedRectangle(cornerRadius: 22, style: .continuous)
                            .stroke(.white.opacity(0.08), lineWidth: 1)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))

                    Text("A compiled IPA is not itself a jailbreak. Real jailbreak functionality requires a compatible exploit chain and device-specific implementation; none is present in this repository.")
                        .font(.system(size: 11))
                        .foregroundStyle(.white.opacity(0.43))
                        .lineSpacing(3)
                        .padding(.horizontal, 3)
                        .padding(.bottom, 28)
                }
                .padding(.horizontal, 18)
                .padding(.top, 18)
                .frame(maxWidth: 620)
                .frame(maxWidth: .infinity)
            }
        }
        .alert("About this build", isPresented: $showBuildInfo) {
            Button("Got it", role: .cancel) { }
        } message: {
            Text("This app reports basic device information and transparently displays that no exploit is bundled. It does not contain kernel or bootrom exploit code, does not escape the iOS sandbox, and does not perform a jailbreak. The GitHub Actions IPA is unsigned and must be signed by a legitimate sideloading workflow before installation.")
        }
        .tint(accent)
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 11) {
            HStack(spacing: 10) {
                ZStack {
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .fill(
                            LinearGradient(
                                colors: [accent.opacity(0.95), Color.purple.opacity(0.75)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 51, height: 51)

                    Image(systemName: "terminal.fill")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundStyle(.white)
                }

                VStack(alignment: .leading, spacing: 4) {
                    Text("JAILBREAK LAB")
                        .font(.system(size: 11, weight: .bold, design: .rounded))
                        .tracking(2.1)
                        .foregroundStyle(accent.opacity(0.98))
                    Text("27.0.1")
                        .font(.system(size: 31, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
                }

                Spacer()

                Text("BUILD")
                    .font(.system(size: 10, weight: .bold, design: .rounded))
                    .tracking(1.2)
                    .foregroundStyle(.white.opacity(0.65))
                    .padding(.horizontal, 10)
                    .padding(.vertical, 7)
                    .background(.white.opacity(0.07))
                    .clipShape(Capsule())
            }

            Text("A transparent starter project and IPA build pipeline.")
                .font(.system(size: 14))
                .foregroundStyle(.white.opacity(0.60))
        }
    }

    private func sectionTitle(_ title: String, icon: String) -> some View {
        HStack(spacing: 9) {
            Image(systemName: icon)
                .font(.system(size: 13, weight: .semibold))
                .foregroundStyle(accent)
            Text(title)
                .font(.system(size: 11, weight: .bold, design: .rounded))
                .tracking(1.5)
                .foregroundStyle(.white.opacity(0.85))
        }
        .padding(.bottom, 2)
    }

    private func infoRow(_ label: String, value: String) -> some View {
        HStack(alignment: .firstTextBaseline, spacing: 16) {
            Text(label)
                .font(.system(size: 13))
                .foregroundStyle(.white.opacity(0.52))
            Spacer(minLength: 8)
            Text(value)
                .font(.system(size: 13, weight: .medium, design: .rounded))
                .foregroundStyle(.white.opacity(0.92))
                .multilineTextAlignment(.trailing)
        }
    }

    private func detailLine(_ label: String, _ value: String) -> some View {
        HStack(alignment: .top, spacing: 14) {
            Text(label)
                .font(.system(size: 12))
                .foregroundStyle(.white.opacity(0.50))
            Spacer(minLength: 8)
            Text(value)
                .font(.system(size: 12, weight: .medium))
                .foregroundStyle(.white.opacity(0.84))
                .multilineTextAlignment(.trailing)
        }
    }
}
