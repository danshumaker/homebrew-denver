class Denver < Formula
  desc "denver dotfiles payload for installation and uninstallation scripts"
  homepage "https://github.com/danshumaker/homebrew-denver"
  version "2025-12-30_17_07_24"
  url "https://codeload.github.com/danshumaker/homebrew-denver/tar.gz/#{version}"
  sha256 "80dbf8db302bcf3655cdd1bd52b049dcd46ae902301067faa5880a8d93630282"
  license "MIT"

  def install
    # Install only dotfiles
    pkgshare.install "dotfiles" "Brewfile"
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
