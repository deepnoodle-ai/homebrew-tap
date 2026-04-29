class Mobius < Formula
  desc "CLI for the Mobius workflow orchestration platform"
  homepage "https://www.mobiusops.ai/"
  version "0.0.18"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.18/mobius-darwin-arm64"
      sha256 "138181875fe24105be51686532084cf1de3ceda3c9d7e886022d1773e474be92"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.18/mobius-darwin-amd64"
      sha256 "99b265411b885699923ffb79f880e93f668fef3b749bd268ee2905946e89fbc4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.18/mobius-linux-arm64"
      sha256 "638738a92519cd07d547a363010a41a08909810d44cb050de91627d62386c95d"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.18/mobius-linux-amd64"
      sha256 "e91266e70698a5d7c0f93804361dfaf21a703bce109951a53994be0ffcaa96b4"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.0.18", shell_output("#{bin}/mobius --version 2>&1")
  end
end
