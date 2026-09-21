class Lns < Formula
  desc "Run local development services at stable local names"
  homepage "https://github.com/crown-dev-studios/lns"
  url "https://github.com/crown-dev-studios/lns/archive/fc92adfea043d2ef53489caaddb8cd83e02480cc.tar.gz"
  version "0.1.0"
  sha256 "58d4fe678b1bbe653c7eaa9e517293f7f28459ca6022c5b84661ec968d6adbcd"
  license "MIT"
  revision 1

  head "https://github.com/crown-dev-studios/lns.git", branch: "main"

  bottle do
    root_url "https://github.com/crown-dev-studios/homebrew-tap/releases/download/lns-0.1.0_1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "0464fab03d2a0c264685bb300389697a1354345ac2915e016c79b0b4cca53bc4"
    sha256 cellar: :any,                 x86_64_linux: "0ef478031a5782ed2f6c5a62d8e62ca1fe81170394b9f3137516028b7abc880c"
  end

  depends_on "go" => :build
  depends_on "caddy"

  def install
    ldflags = %W[
      -s -w
      -X main.version=#{version}
      -X main.commit=fc92adfea043d2ef53489caaddb8cd83e02480cc
      -X main.buildDate=2026-09-20T21:17:59-04:00
    ]
    system "go", "build", *std_go_args(ldflags:), "./cmd/lns"
  end

  test do
    assert_match "lns version #{version}", shell_output("#{bin}/lns version")
  end
end
