class GitNativeIssue < Formula
  desc "Distributed issue tracking using Git's native data model"
  homepage "https://github.com/remenoscodes/git-native-issue"
  url "https://github.com/remenoscodes/git-native-issue/releases/download/v1.2.0/git-native-issue-v1.2.0.tar.gz"
  sha256 "7392cbd3359b4bbb909e7451b69034a9203f6acbdea8ec505c1bf72feacb3b92"
  license "GPL-2.0-only"
  version "1.2.0"

  depends_on "git"

  def install
    # Install binaries
    bin.install Dir["bin/*"]

    # Install man pages if present
    man1.install Dir["doc/*.1"] if Dir.exist?("doc")

    # Install documentation
    doc.install "README.md", "LICENSE", "ISSUE-FORMAT.md"
  end

  test do
    system "#{bin}/git-issue", "version"
    assert_match "1.0.2", shell_output("#{bin}/git-issue version")
  end
end
