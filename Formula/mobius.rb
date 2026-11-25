class Mobius < Formula
  desc "CLI for the Mobius agent automation platform"
  homepage "https://mobiusops.com/"
  version "0.8.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.8.0/mobius-darwin-arm64"
      sha256 "80bb9ed70187769a08c6226b62bea94c129b485b0b820bedc2b9874635382296"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.8.0/mobius-darwin-amd64"
      sha256 "a00adf639641a3e26bb71d88d87d46d26fcfa2e0e5f205387f7e13387e75cb13"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.8.0/mobius-linux-arm64"
      sha256 "5b4c1e2b844c055fc897b43991c7306ec7c95da3cb245e6f2ffa9fabd2a1140b"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.8.0/mobius-linux-amd64"
      sha256 "a2cb31388372ebcd63f8b2396b0e101217b9d9f3b665eeaaa261941dc7071813"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.8.0", shell_output("#{bin}/mobius --version 2>&1")
  end
end
