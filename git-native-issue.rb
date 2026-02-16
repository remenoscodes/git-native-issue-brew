class GitNativeIssue < Formula
  desc "Distributed issue tracking using Git's native data model"
  homepage "https://github.com/remenoscodes/git-native-issue"
  url "https://github.com/remenoscodes/git-native-issue/releases/download/v1.3.1/git-native-issue-v1.3.1.tar.gz"
  sha256 "1f15db8a5838a1f77e0403242fd390354390387ee9b4409c22bc575ed93e7a5e"
  license "GPL-2.0-only"
  version "1.3.1"

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
    assert_match "1.3.1", shell_output("#{bin}/git-issue version")
  end
end
