class Mobius < Formula
  desc "CLI for the Mobius agent automation platform"
  homepage "https://www.mobiusops.ai/"
  version "0.0.54"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.54/mobius-darwin-arm64"
      sha256 "f9254fc1802301476eb2abda7e13b40d4f9acb891af029070d2a32ba46fbe6e0"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.54/mobius-darwin-amd64"
      sha256 "6a22759559c6f418e0a6f5103e23a1693f30970b6b1e62cc1eb37f083821c90e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.54/mobius-linux-arm64"
      sha256 "d8d7095fbc6d61065c723da457d379a69df42cc3556b07f1cf83a3124d8692cf"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.54/mobius-linux-amd64"
      sha256 "903689ca431b7780bc344e6aa2343a3c3b447e83f56eb83df2bb87dc2a043a50"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.0.54", shell_output("#{bin}/mobius --version 2>&1")
  end
end
