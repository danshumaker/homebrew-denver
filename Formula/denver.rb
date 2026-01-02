class Denver < Formula
  desc "denver dotfiles payload for installation and uninstallation scripts"
  homepage "https://github.com/danshumaker/homebrew-denver"
  version "2026-01-02_17_15_34"
  url "https://codeload.github.com/danshumaker/homebrew-denver/tar.gz/#{version}"
  sha256 "4b02a3cda26f64b602416b9b9d22ad912aee51d5b0d6dbae5745e6a3838b96bd"
  license "MIT"

  def install
    # Install only dotfiles
    pkgshare.install "dotfiles"
    pkgshare.install "Brewfile"
  end

end
