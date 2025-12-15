class Denver < Formula
  desc "denver dotfiles payload for installation and uninstallation scripts"
  homepage "https://github.com/danshumaker/homebrew-denver"
  version "2025-12-14_20_20_38"
  url "https://github.com/danshumaker/homebrew-denver/archive/refs/tags/#{version}.tar.gz"
  sha256 "d119668185edeadc190c94c41b1b691e59836137f4585cb61014f8a6f8d7dc59"
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
