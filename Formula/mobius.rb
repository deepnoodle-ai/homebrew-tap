class Mobius < Formula
  desc "CLI for the Mobius agent automation platform"
  homepage "https://www.mobiusops.ai/"
  version "0.0.43"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.43/mobius-darwin-arm64"
      sha256 "9cb2f3f0b4b42665dfa2f8561bb565ac48c41e0c1fd00489c2cedf6602ecf478"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.43/mobius-darwin-amd64"
      sha256 "082a6202f4026930717414672dac46c4294835add9306eb3bbe3035ed9530341"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.43/mobius-linux-arm64"
      sha256 "8091e32e48a78775f24bdd612bed4dae9c25474df1e9a3c95147b6327fc1e3c7"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.43/mobius-linux-amd64"
      sha256 "a2ae234aaa8df637fd336997dfc2c22ba3f8a56d399a1927e8ba3542d3552d3e"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.0.43", shell_output("#{bin}/mobius --version 2>&1")
  end
end
