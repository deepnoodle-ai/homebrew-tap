class Mobius < Formula
  desc "CLI for the Mobius workflow orchestration platform"
  homepage "https://www.mobiusops.ai/"
  version "0.0.14"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.14/mobius-darwin-arm64"
      sha256 "b52dccbd22cea0846ae2bf0d685cb1979681a64f47ebf874ecc563cc37a01260"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.14/mobius-darwin-amd64"
      sha256 "5b1fd76ecc5d4a6e387ea9eeaea22fd6dac36d48162f42ef480b7da5fc031ec1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.14/mobius-linux-arm64"
      sha256 "f9d5f003d63072555345cb6c3d4aef3e329379374e59514b10b4b93b5bef7771"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.14/mobius-linux-amd64"
      sha256 "3d797f905e4a042b805690eca7a072eefc64abd8bd5a793592a8aa1734001695"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.0.14", shell_output("#{bin}/mobius --version 2>&1")
  end
end
