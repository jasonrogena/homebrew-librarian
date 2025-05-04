class FsLibrarian < Formula
  desc "Runs pre-configured commands against a group of files that match some filters"
  homepage "https://github.com/jasonrogena/librarian"
  url "https://github.com/jasonrogena/librarian.git",
    tag:      "v0.4.8",
    revision: "9cd286eb1dac45f4e300e81a0f9f26452e7a4fc1"
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
