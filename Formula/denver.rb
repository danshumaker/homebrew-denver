class Denver < Formula
  desc "denver dotfiles payload for installation and uninstallation scripts"
  homepage "https://github.com/danshumaker/homebrew-denver"
  version "2026-01-02_13_55_35"
  url "https://codeload.github.com/danshumaker/homebrew-denver/tar.gz/#{version}"
  sha256 "5eb52488d1622b4c117a87dcdeaa5ff0842586a65e9d8650fcf7db8b66c892bf"
  license "MIT"

  def install
    # Install only dotfiles
    pkgshare.install "dotfiles"
    pkgshare.install "Brewfile"
  end

end
