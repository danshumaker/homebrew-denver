class Denver < Formula
  desc "denver dotfiles payload for installation and uninstallation scripts"
  homepage "https://github.com/danshumaker/homebrew-denver"
  version "2025-12-14_14_00_55"
  url "https://github.com/danshumaker/homebrew-denver/archive/refs/tags/#{version}.tar.gz"
  sha256 "fbc83342417d63aab4d2519628f31f861862874c40648309d749e773b7e8a8b9"
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
