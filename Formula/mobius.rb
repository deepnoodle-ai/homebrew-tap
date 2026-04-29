class Mobius < Formula
  desc "CLI for the Mobius workflow orchestration platform"
  homepage "https://www.mobiusops.ai/"
  version "0.0.17"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.17/mobius-darwin-arm64"
      sha256 "5ad8258aefe159e26b513c27d51d005dfed15851a614aee5a7b39f07e82039c4"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.17/mobius-darwin-amd64"
      sha256 "5955d27028c44dfd570e675b06c4c91ff2d6d48cd8f84e8d6e59acf814799964"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.17/mobius-linux-arm64"
      sha256 "df2140089e99673bbe7c877641dc20d22be5f82fc2d9bc9e41b760a08f6ffe13"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.17/mobius-linux-amd64"
      sha256 "e0962485afa3ac6bd5acf5bba19fb5719ee56d22d30d153ec9d911603d4ac15d"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.0.17", shell_output("#{bin}/mobius --version 2>&1")
  end
end
