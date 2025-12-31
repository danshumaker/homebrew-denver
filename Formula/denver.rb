class Denver < Formula
  desc "denver dotfiles payload for installation and uninstallation scripts"
  homepage "https://github.com/danshumaker/homebrew-denver"
  version "2025-12-30_19_43_58"
  url "https://codeload.github.com/danshumaker/homebrew-denver/tar.gz/#{version}"
  sha256 "6d75c0b46a6a6fa04195da4ecdb0248ab80429b609e8dfb6ad2fc3ea853c212b"
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
