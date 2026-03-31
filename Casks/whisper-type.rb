cask "whisper-type" do
  version "1.0.0"
  sha256 "e40e8f2477ce5b2281d8e707370f2c867bee25428aeb5cbb4738abd30e91a2ba"

  url "https://github.com/marc1107/whisper-type/releases/download/v#{version}/WhisperType-v#{version}-arm64.dmg"
  name "WhisperType"
  desc "Local speech-to-text dictation for macOS, powered by whisper.cpp"
  homepage "https://github.com/marc1107/whisper-type"

  depends_on macos: ">= :sonoma"
  depends_on arch: :arm64

  app "WhisperType.app"

  postflight do
    ohai "WhisperType needs Accessibility and Microphone permissions."
    ohai "Go to: System Settings → Privacy & Security → Accessibility → Enable WhisperType"
  end

  zap trash: [
    "~/Library/Application Support/WhisperType",
    "~/Library/Preferences/com.whispertype.app.plist",
  ]
end
