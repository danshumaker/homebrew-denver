class Shushop < Formula
  desc "ShuShop dotfiles payload for installation and uninstallation scripts"
  homepage "https://github.com/danshumaker/homebrew-shushop"
  version File.read(File.expand_path("../../VERSION", __dir__)).strip
  url "https://github.com/danshumaker/homebrew-shushop/archive/refs/tags/v${version}.tar.gz"
  sha256 "REPLACE_ME"
  license "MIT"

  def install
    # Install everything into pkgshare except the Formula directory itself
    payload = Dir["*"] - ["Formula"]
    pkgshare.install payload
  end

  def caveats
    <<~EOS
      The ShuShop payload has been installed into:
        #{pkgshare}

      To install ShuShop fully:
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/danshumaker/homebrew-shushop/main/install.sh)"

      To uninstall ShuShop:
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/danshumaker/homebrew-shushop/main/uninstall.sh)"
    EOS
  end
end
