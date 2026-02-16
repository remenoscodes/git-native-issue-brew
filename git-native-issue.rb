class GitNativeIssue < Formula
  desc "Distributed issue tracking using Git's native data model"
  homepage "https://github.com/remenoscodes/git-native-issue"
  url "https://github.com/remenoscodes/git-native-issue/releases/download/v1.3.0/git-native-issue-v1.3.0.tar.gz"
  sha256 "6ae400fb6b2b283cd994665f87034c60e838fd04b1d8d6590168027469b7a2ae"
  license "GPL-2.0-only"
  version "1.3.0"

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
    assert_match "1.3.0", shell_output("#{bin}/git-issue version")
  end
end
