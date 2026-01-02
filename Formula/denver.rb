class Denver < Formula
  desc "denver dotfiles payload for installation and uninstallation scripts"
  homepage "https://github.com/danshumaker/homebrew-denver"
  version "2026-01-02_17_15_34"
  url "https://codeload.github.com/danshumaker/homebrew-denver/tar.gz/#{version}"
  sha256 "29d0f8fb56b13860985b05edcea100307ec065a1533ea97d4bc6aa8fa9f58bda"
  license "MIT"

  def install
    # Install only dotfiles
    pkgshare.install "dotfiles"
    pkgshare.install "Brewfile"
  end

end
