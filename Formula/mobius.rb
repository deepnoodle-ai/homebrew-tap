class Mobius < Formula
  desc "CLI for the Mobius agent automation platform"
  homepage "https://www.mobiusops.ai/"
  version "0.0.32"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.32/mobius-darwin-arm64"
      sha256 "f0f2b25c4ebeff860e46d5131bffb336080e520afc458c461783f3ee86932904"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.32/mobius-darwin-amd64"
      sha256 "44ab7629717c037dc6532ab9360354e2b08ae4ea226e8000996791f3a63f9366"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.32/mobius-linux-arm64"
      sha256 "f61f44d09731157565ecf4a4858190370d39f207270edc050ed8c15697e11d8c"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.32/mobius-linux-amd64"
      sha256 "3f6d850e8031d2fb8c021058ca065d06f8b153e0a0409fc067cd2269c7c0a5c9"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.0.32", shell_output("#{bin}/mobius --version 2>&1")
  end
end
