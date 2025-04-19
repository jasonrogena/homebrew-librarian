class FsLibrarian < Formula
  desc "Runs pre-configured commands against a group of files that match some filters"
  homepage "https://github.com/jasonrogena/librarian"
  url "https://github.com/jasonrogena/librarian.git",
    tag:      "v0.4.2",
    revision: "bca8551650e67ce9e0ecc8334393360486e00066"
  license "MIT"
  head "https://github.com/jasonrogena/librarian.git", branch: "main"

  depends_on "make" => :build
  depends_on "rustup-init" => :build

  def install
    system "#{Formula["rustup-init"].bin}/rustup-init", "-y", "--no-modify-path"
    ENV.prepend_path "PATH", HOMEBREW_CACHE/"cargo_cache/bin"
    system "make", "build"
    bin.install "target/release/fs-librarian"
  end

  test do
    system "target/release/fs-librarian", "test", "mime", "LICENSE"
  end
end
