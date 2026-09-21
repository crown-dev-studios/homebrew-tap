class Lns < Formula
  desc "Run local development services at stable local names"
  homepage "https://github.com/crown-dev-studios/lns"
  license "MIT"

  depends_on "caddy"

  on_macos do
    on_arm do
      url "https://github.com/crown-dev-studios/lns/releases/download/v0.1.0/lns_0.1.0_darwin_arm64.tar.gz"
      sha256 "7e83003af8f175af2d86c4129bdabf83a671abb1c01110c7dd11233145a9db19"
    end

    on_intel do
      url "https://github.com/crown-dev-studios/lns/releases/download/v0.1.0/lns_0.1.0_darwin_amd64.tar.gz"
      sha256 "538e1661aa93f825ef700ca453d115e431c47a45ea6d66c682d266451fcb6b82"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/crown-dev-studios/lns/releases/download/v0.1.0/lns_0.1.0_linux_arm64.tar.gz"
      sha256 "87e81472fcce0945c8c59137098fb6096d0c639955cc75afa5bafddea7bfb305"
    end

    on_intel do
      url "https://github.com/crown-dev-studios/lns/releases/download/v0.1.0/lns_0.1.0_linux_amd64.tar.gz"
      sha256 "730f3eaadc34ab0087ce2f4819ad81fd5c3982452ef2a7e83420106f0e8bf9b2"
    end
  end

  def install
    bin.install "lns"
  end

  test do
    assert_match "lns version #{version}", shell_output("#{bin}/lns version")
  end
end
