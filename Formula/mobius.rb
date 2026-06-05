class Mobius < Formula
  desc "CLI for the Mobius agent automation platform"
  homepage "https://www.mobiusops.ai/"
  version "0.0.23"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.23/mobius-darwin-arm64"
      sha256 "e0a7fcf821c12f9b478fd766b5fbf22ae9500443608c70640644564af48ed6f2"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.23/mobius-darwin-amd64"
      sha256 "f2ce3b69e43ca3caaaa8f202e810de643ba3eb6226ab9d6b078e6eb96281e2a8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.23/mobius-linux-arm64"
      sha256 "e9a5eb176c34835cf5efb39cb14a0514bca8365b2d4acd41da7695ff510f43a6"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.23/mobius-linux-amd64"
      sha256 "10eaf1fe23f6e6f5e8282fefc06ab7da8be74228c875326140eb6e093e60794c"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.0.23", shell_output("#{bin}/mobius --version 2>&1")
  end
end
