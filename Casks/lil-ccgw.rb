cask "lil-ccgw" do
  version "0.2.0"
  sha256 "8d892ac239bdd594015acab1e1a82fed1e33cf81d2a2d058eb5689678d7cb0f5"

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
