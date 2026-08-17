cask "lil-ccgw" do
  version "0.4.1"
  sha256 "703ff293f382b283bf70567e769f67b29dc0953c36c8250634d94ec8ba4c1f7a"

  url "https://github.com/AndrewHYi/lil-ccgw/releases/download/v#{version}/lil-ccgw-#{version}.zip"
  name "lil-ccgw"
  desc "Menu bar app for the ccgw Claude Code cost gateway"
  homepage "https://github.com/AndrewHYi/lil-ccgw"

  depends_on macos: :sonoma # macOS 14

  app "lil-ccgw.app"

  # Ad-hoc signed: there is no Developer ID on the build machine, so
  # notarization is impossible and Gatekeeper would otherwise refuse to launch
  # it. Stripping the quarantine attribute is the same posture AeroSpace takes.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/lil-ccgw.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Preferences/com.andrewhyi.lil-ccgw.plist",
  ]
end
