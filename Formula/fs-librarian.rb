class FsLibrarian < Formula
  desc "Librarian runs pre-configured commands against a group of files that match a set of filters"
  homepage "https://github.com/jasonrogena/librarian"
  license "MIT"
  head "https://github.com/jasonrogena/librarian.git", branch: "main"
  url "https://github.com/jasonrogena/librarian.git",
    tag:      "v0.2.1",
    revision: "c23105547a5f403143f976e5da2b4a7ddc8108a0"

  depends_on "make" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    system "make", "build"
    bin.install "target/release/fs-librarian"
  end
 
  test do
    system "target/release/fs-librarian", "test", "mime", "LICENSE"
  end
end
