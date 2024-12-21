class Usage < Formula
  desc "Tool for CLIs"
  homepage "https://github.com/jdx/usage"
  url "https://github.com/jdx/usage/archive/refs/tags/v1.7.3.tar.gz"
  sha256 "b6cb9cc6279b5d7c00a7a387756c1f207878c499a257bf7538695ca782df702d"
  license "MIT"
  head "https://github.com/jdx/usage.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "cli")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/usage --version")
  end
end
