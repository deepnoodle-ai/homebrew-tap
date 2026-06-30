class Mobius < Formula
  desc "CLI for the Mobius agent automation platform"
  homepage "https://www.mobiusops.ai/"
  version "0.0.29"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.29/mobius-darwin-arm64"
      sha256 "40c8674554f2459dfeb8c794a448cdc0e1440554778e59888cbcc687856ef433"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.29/mobius-darwin-amd64"
      sha256 "25cf85804952260315c8c79166cedc42c1a9aac6f81ffc2f98c7b4cfff6ba02e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.29/mobius-linux-arm64"
      sha256 "7d5c9f31c1fbeb8aa69525ae6361de26e7b71985f6758c329a56a5d399422246"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.29/mobius-linux-amd64"
      sha256 "94971cb7af351eb0499771b7bf23a6405c8dab8ca979033faafd0fa3a136fbda"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.0.29", shell_output("#{bin}/mobius --version 2>&1")
  end
end
