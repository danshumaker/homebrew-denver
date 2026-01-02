class Denver < Formula
  desc "denver dotfiles payload for installation and uninstallation scripts"
  homepage "https://github.com/danshumaker/homebrew-denver"
  version "2026-01-02_13_55_35"
  url "https://codeload.github.com/danshumaker/homebrew-denver/tar.gz/#{version}"
  sha256 "ee82e4e1b6de3109f6d05d8124adc43467bf3cce7d664c272414aa0f920e162d"
  license "MIT"

  def install
    # Install only dotfiles
    pkgshare.install "dotfiles"
    pkgshare.install "Brewfile"
  end

end
