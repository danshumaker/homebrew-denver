class Denver < Formula
  desc "denver dotfiles payload for installation and uninstallation scripts"
  homepage "https://github.com/danshumaker/homebrew-denver"
  version "2026-01-02_20_33_14"
  url "https://codeload.github.com/danshumaker/homebrew-denver/tar.gz/#{version}"
  sha256 "a14fec9d612dc20fab9492d514ab124745b724255edff1e8d548f6e4b5f642b2"
  license "MIT"

  def install
    rm_rf pkgshare/"dotfiles"
    pkgshare.install "dotfiles"
    pkgshare.install "Brewfile"
  end

end
