class GitNativeIssue < Formula
  desc "Distributed issue tracking using Git's native data model"
  homepage "https://github.com/remenoscodes/git-native-issue"
  url "https://github.com/remenoscodes/git-native-issue/releases/download/v1.3.3/git-native-issue-v1.3.3.tar.gz"
  sha256 "b4fb6f48e7aff280c624e93741f0337c3cdc8011fde37769602609a7aa7c9bf5"
  license "GPL-2.0-only"
  version "1.3.3"

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
    assert_match "1.3.3", shell_output("#{bin}/git-issue version")
  end
end
