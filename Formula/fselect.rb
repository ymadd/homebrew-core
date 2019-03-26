class Fselect < Formula
  desc "Find files with SQL-like queries"
  homepage "https://github.com/jhspetersson/fselect"
  url "https://github.com/jhspetersson/fselect/archive/0.6.2.tar.gz"
  sha256 "fa3088bc6622a5684850e62d5b2a746b5c251e88b52ec3327ad1e256eff0cc22"

  bottle do
    cellar :any_skip_relocation
    sha256 "c383744b835fcd5ad8baa02e57bea84faa2e6ec106aca87050c5b4f6f2b68e54" => :mojave
    sha256 "800a4198695eac116f3ab986b75ffcf1ce56dd9eea3751fae737a7883a0a0664" => :high_sierra
    sha256 "6535c9a39e8a4c641a61dfb003b22b0ef9e828684d96b5c4fffd398676d78d9f" => :sierra
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--root", prefix, "--path", "."
  end

  test do
    touch testpath/"test.txt"
    cmd = "#{bin}/fselect name from . where name = '*.txt'"
    assert_match "test.txt", shell_output(cmd).chomp
  end
end
