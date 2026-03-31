cask "whisper-type" do
  version "1.1.0"
  sha256 "1c0d10544a83c17f943d830a18deadce7d7975491234bbdff660f8fb57122c80"

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
