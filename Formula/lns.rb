class Lns < Formula
  desc "Run local development services at stable local names"
  homepage "https://github.com/crown-dev-studios/lns"
  url "https://github.com/crown-dev-studios/lns/archive/fc92adfea043d2ef53489caaddb8cd83e02480cc.tar.gz"
  version "0.1.0"
  sha256 "58d4fe678b1bbe653c7eaa9e517293f7f28459ca6022c5b84661ec968d6adbcd"
  license "MIT"
  revision 1

  head "https://github.com/crown-dev-studios/lns.git", branch: "main"

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
