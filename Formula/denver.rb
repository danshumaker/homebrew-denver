class Denver < Formula
  desc "denver dotfiles payload for installation and uninstallation scripts"
  homepage "https://github.com/danshumaker/homebrew-denver"
  version "2026-02-06_14_55_00"
  url "https://codeload.github.com/danshumaker/homebrew-denver/tar.gz/#{version}"
  sha256 "cd06686fdbe05e4ad66762516dcf5bcc464b53975708b5fd9c61b226ff51b94c"
  license "MIT"

  def install
    rm_rf pkgshare/"dotfiles"
    pkgshare.install "dotfiles"
    pkgshare.install "Brewfile"
  end

end
