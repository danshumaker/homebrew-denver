class Denver < Formula
  desc "denver dotfiles payload for installation and uninstallation scripts"
  homepage "https://github.com/danshumaker/homebrew-denver"
  version "2026-01-02_17_40_10"
  url "https://codeload.github.com/danshumaker/homebrew-denver/tar.gz/#{version}"
  sha256 "d528b862fa67e567495e2dcc25b6e8d32e9cb5f626cfe3538f564c5b6b93a60c"
  license "MIT"

  def install
    rm_rf pkgshare/"dotfiles"
    pkgshare.install "dotfiles"
    pkgshare.install "Brewfile"
  end

end
