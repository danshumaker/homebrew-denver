class Denver < Formula
  desc "denver dotfiles payload for installation and uninstallation scripts"
  homepage "https://github.com/danshumaker/homebrew-denver"
  version "2025-12-30_19_43_58"
  url "https://codeload.github.com/danshumaker/homebrew-denver/tar.gz/#{version}"
  sha256 "ebd181b6fb7db03ff1978b50503f29233c21fec8f9a750b0bdf89c5addbc25b7"
  license "MIT"

  def install
    # Install only dotfiles
    pkgshare.install "dotfiles" 
    pkgshare.install "Brewfile" if File.exist?("Brewfile")
  end

  def caveats
    <<~EOS
      The denver dotfiles have been installed into:
        #{pkgshare}

      To install denver fully:
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/danshumaker/homebrew-denver/main/install.sh)"

      To uninstall denver:
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/danshumaker/homebrew-denver/main/uninstall.sh)"
    EOS
  end
end
