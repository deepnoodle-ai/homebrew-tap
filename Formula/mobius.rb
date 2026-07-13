class Mobius < Formula
  desc "CLI for the Mobius agent automation platform"
  homepage "https://www.mobiusops.ai/"
  version "0.0.47"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.47/mobius-darwin-arm64"
      sha256 "67873f2072816e22a041950b346116d36750b2e82025e7493d805927df01d755"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.47/mobius-darwin-amd64"
      sha256 "32e0a1f85d3a3143cf6e14ef9317450b41cebd8e4a1c8b1f8ad585ca1bd021e0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.47/mobius-linux-arm64"
      sha256 "6f7634424276e1a71a12078424d6119902575e5954a42deb7c55e2c96c5a73ba"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.47/mobius-linux-amd64"
      sha256 "22e9b5e97ef82fbcb0baa0a85a51b2afb82b5d96ab0b31a06067d8fc9ea5eb9f"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.0.47", shell_output("#{bin}/mobius --version 2>&1")
  end
end
