class Denver < Formula
  desc "denver dotfiles payload for installation and uninstallation scripts"
  homepage "https://github.com/danshumaker/homebrew-denver"
  version "2026-02-09_19_53_45"
  url "https://codeload.github.com/danshumaker/homebrew-denver/tar.gz/#{version}"
  sha256 "01c4bb7eb030764e332742c7b88ad687cc2e560b65e57e6186e8f176a07924db"
  license "MIT"

  def install
    rm_rf pkgshare/"dotfiles"
    pkgshare.install "dotfiles"
    pkgshare.install "Brewfile"
  end

end
