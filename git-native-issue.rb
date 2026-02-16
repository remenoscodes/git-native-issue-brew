class GitNativeIssue < Formula
  desc "Distributed issue tracking using Git's native data model"
  homepage "https://github.com/remenoscodes/git-native-issue"
  url "https://github.com/remenoscodes/git-native-issue/releases/download/v1.3.2/git-native-issue-v1.3.2.tar.gz"
  sha256 "40b1cb3f92c457452e201e23e7327d53896bba1c09da8519467c7f402f35075e"
  license "GPL-2.0-only"
  version "1.3.2"

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
    assert_match "1.3.2", shell_output("#{bin}/git-issue version")
  end
end
