class Mobius < Formula
  desc "CLI for the Mobius agent automation platform"
  homepage "https://www.mobiusops.ai/"
  version "0.0.50"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.50/mobius-darwin-arm64"
      sha256 "3140b4a81094ede0cbc779b4d6d1b00e52afd544c725dd4d0a6aad2335398944"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.50/mobius-darwin-amd64"
      sha256 "0511c2fb58f21ae9028e6bc867a2b214c37812735d46a98c8a49600175a56ad3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.50/mobius-linux-arm64"
      sha256 "6d7fa082559584b4e15c80d306ccece9053e70cb9a18cfac7c88463ce3ecf10f"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.50/mobius-linux-amd64"
      sha256 "99630f7d7480fad4f3871e4cbea551a44a93566e4a4386077e791032f76b1eaf"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.0.50", shell_output("#{bin}/mobius --version 2>&1")
  end
end
