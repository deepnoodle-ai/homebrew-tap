class Mobius < Formula
  desc "CLI for the Mobius workflow orchestration platform"
  homepage "https://www.mobiusops.ai/"
  version "0.0.12"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.12/mobius-darwin-arm64"
      sha256 "f8c19a79b483311483397004ae88dd344e1bc876453e1b32922bc5e097148174"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.12/mobius-darwin-amd64"
      sha256 "27832207da61a601515a6c2a089008a1e9c520e4e2ebe12e8f074892b1d4fead"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.12/mobius-linux-arm64"
      sha256 "284098838392e37c73f448273b617453915a15ca1e65b7899644786463176696"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.12/mobius-linux-amd64"
      sha256 "8a42014d2b9841cbbac9c1de5197adcf73390d26a828ff13be54bb9f98d33d04"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.0.12", shell_output("#{bin}/mobius --version 2>&1")
  end
end
