class Pretty < Formula
  desc "AI design agent for graphic design and media"
  homepage "https://prettydraft.com"
  version "0.0.3"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.prettydraft.com/pretty/0.0.3/pretty-darwin-arm64"
      sha256 "c9bb96ee1327d05033cf427cdf08e66660266cb5884cdce1a6ef154ce95accf7"
    else
      url "https://dl.prettydraft.com/pretty/0.0.3/pretty-darwin-amd64"
      sha256 "e80d01eb1887f0a90ca84fb226c5185ba47bdd42973c2813cfeeaed7a461c977"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.prettydraft.com/pretty/0.0.3/pretty-linux-arm64"
      sha256 "68fc30e10e6fc370c4b2e6efcbd7b7177759c3198486c1fc7c75f74730e0da15"
    else
      url "https://dl.prettydraft.com/pretty/0.0.3/pretty-linux-amd64"
      sha256 "c1c466ca5cbf717d399f6ffd58c5039e5ff138ac757eaeb5214c861b7aa7fb18"
    end
  end

  def install
    binary = Dir["pretty-*"].first || "pretty"
    bin.install binary => "pretty"
  end

  test do
    assert_match "pretty version", shell_output("#{bin}/pretty version 2>&1")
  end
end
