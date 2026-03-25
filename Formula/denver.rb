class Denver < Formula
  desc "denver dotfiles payload for installation and uninstallation scripts"
  homepage "https://github.com/danshumaker/homebrew-denver"
  version "2026-03-25_10_48_50"
  url "https://codeload.github.com/danshumaker/homebrew-denver/tar.gz/#{version}"
  sha256 "7e42ad8857e1a0fc0ebe3cb283c06fdecb02ef902ccd762eec91248a705235b9"
  license "MIT"

  def install
    rm_rf pkgshare/"dotfiles"
    pkgshare.install "dotfiles"
    pkgshare.install "Brewfile"
  end

end
