class Denver < Formula
  desc "denver dotfiles payload for installation and uninstallation scripts"
  homepage "https://github.com/danshumaker/homebrew-denver"
  version "2025-12-30_20_43_32"
  url "https://codeload.github.com/danshumaker/homebrew-denver/tar.gz/#{version}"
  sha256 "d202e4c483e32a1d038b72a76fba3d36674e9d5ad0f6122c14b40161726078ce"
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
