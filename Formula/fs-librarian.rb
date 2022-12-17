class FsLibrarian < Formula
  desc "Runs pre-configured commands against a group of files that match some filters"
  homepage "https://github.com/jasonrogena/librarian"
  url "https://github.com/jasonrogena/librarian/releases/download/v0.3.2/fs-librarian-0.3.2.tar.gz"
    tag:      "v0.3.0",
    revision: "a67602eda640e1f34e96c76dc06bb7fae028b26d"
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
