class FsLibrarian < Formula
  desc "Runs pre-configured commands against a group of files that match some filters"
  homepage "https://github.com/jasonrogena/librarian"
  url "https://github.com/jasonrogena/librarian.git",
    tag:      "v0.4.3",
    revision: "6a6fb339c66657341ac32a534a189959af19c4d2"
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
