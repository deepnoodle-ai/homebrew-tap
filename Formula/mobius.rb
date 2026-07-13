class Mobius < Formula
  desc "CLI for the Mobius agent automation platform"
  homepage "https://www.mobiusops.ai/"
  version "0.0.46"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.46/mobius-darwin-arm64"
      sha256 "022e2eb252d5154ce47335c35015c1357eb8c62a1327e9422fca11aaf4deb119"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.46/mobius-darwin-amd64"
      sha256 "71dc041ac71c882d85fa6224f6622ee1f4b70883201b9dbc0171897de7e1659d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.46/mobius-linux-arm64"
      sha256 "b23ffb0686767e44140c88f604b991372d7e59b90d5093bf554d27f3f3038b17"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.46/mobius-linux-amd64"
      sha256 "2956584798f2dff4975827bf13526b6ec71bc5db8276b4f8ac662bde4d5d8b01"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.0.46", shell_output("#{bin}/mobius --version 2>&1")
  end
end
