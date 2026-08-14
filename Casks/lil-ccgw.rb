cask "lil-ccgw" do
  version "0.4.0"
  sha256 "7b06f65577da58fb5078cb8970bfc991873167cd873190158aaa955c158b2e6e"

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
