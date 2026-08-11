class Nvoken < Formula
  desc "Command-line client for the nvoken durable agent runtime"
  homepage "https://github.com/deepnoodle-ai/nvoken"
  version "0.12.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.12.0/nvoken_0.12.0_darwin_arm64.tar.gz"
      sha256 "059133835c7f17bcc4cc0137ae8d846f204d9776e3de2318b131d9651a8fd395"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.12.0/nvoken_0.12.0_darwin_amd64.tar.gz"
      sha256 "bf72016f354e376e9980ec99be22e185aa57436dda7090f037ae5d593802727d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.12.0/nvoken_0.12.0_linux_arm64.tar.gz"
      sha256 "3a102e8b8eeb96b7c79b083c746a4619aa26aeb7a949da080f802764352033dc"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.12.0/nvoken_0.12.0_linux_amd64.tar.gz"
      sha256 "f0ce5279c4238312fe51c41f660adb21d91d1dd95512b66734172a8deabaf4bb"
    end
  end

  def install
    bin.install "nvoken"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nvoken --version 2>&1")
  end
end
