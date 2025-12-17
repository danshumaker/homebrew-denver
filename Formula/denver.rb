class Denver < Formula
  desc "denver dotfiles payload for installation and uninstallation scripts"
  homepage "https://github.com/danshumaker/homebrew-denver"
  version "2025-12-17_16_44_20"
  url "https://github.com/danshumaker/homebrew-denver/archive/refs/tags/#{version}.tar.gz"
  sha256 "c9d140ee9cf35e7e57a2b62bf52dc6c64c3b4ac567db877094564f9216ccb430"
  license "MIT"

  def install
    # Install everything into pkgshare except the Formula directory itself
    payload = Dir["*"] - ["Formula"]
    pkgshare.install payload
  end

  def caveats
    <<~EOS
      The denver payload has been installed into:
        #{pkgshare}

      To install denver fully:
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/danshumaker/homebrew-denver/main/install.sh)"

      To uninstall denver:
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/danshumaker/homebrew-denver/main/uninstall.sh)"
    EOS
  end
end
