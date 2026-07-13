class Mobius < Formula
  desc "CLI for the Mobius agent automation platform"
  homepage "https://www.mobiusops.ai/"
  version "0.0.45"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.45/mobius-darwin-arm64"
      sha256 "1779ebf3f1722146319d1cf471ad2dbb4004a35c338c32ed8ba7cd9e8726a58f"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.45/mobius-darwin-amd64"
      sha256 "4078934df62222a707f4afbe08bbaf2a50bef0a1b047a5512e10b1d54bf9a76e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.45/mobius-linux-arm64"
      sha256 "fca86cbfc06deb7b19f7fbd576c45032a4ca566a1f555021645b05c28af6b20d"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.45/mobius-linux-amd64"
      sha256 "35affc1142d27f6131d61fda81c0693578813ebea9099e5e9e92873ebc18cc82"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.0.45", shell_output("#{bin}/mobius --version 2>&1")
  end
end
