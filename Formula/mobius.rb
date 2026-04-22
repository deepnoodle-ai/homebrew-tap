class Mobius < Formula
  desc "CLI for the Mobius workflow orchestration platform"
  homepage "https://www.mobiusops.ai/"
  version "0.0.5"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.5/mobius-darwin-arm64"
      sha256 "192256e27adf6bfc72c09797f09e99e0855ebc9da6b8631ec1b0faf405cffe71"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.5/mobius-darwin-amd64"
      sha256 "140327ba65149bcc89ade7b3bcda13c3bb748e6720a7ffd4eec25c61dfa725d4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.5/mobius-linux-arm64"
      sha256 "0d57cd1d31783a383d12aadef267fd68c1c8dfb4e8191a600e23f450db2343c9"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.5/mobius-linux-amd64"
      sha256 "4ebd491b08a778d903bddd1720a83180fa55fb2187919929510ce2e9e9f25035"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.0.5", shell_output("#{bin}/mobius --version 2>&1")
  end
end
