class Maya < Formula
  desc "A CLI for developers"
  homepage "https://github.com/lentscode/maya"
  version "0.0.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/lentscode/maya/releases/download/v#{version}/maya-macos-x86_64"
    sha256 "9a4cbb522e22b7022c41d2abcfdaed20f4aa295eb9f91a94e85f46a9b6e898d3"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/lentscode/maya/releases/download/v#{version}/maya-macos-arm64"
    sha256 "d4cca69cd79e1fdb785afcbefe6fe26caf389773730723ecfdc568b244a4e05c"
  elsif OS.linux?
    url "https://github.com/lentscode/maya/releases/download/v#{version}/maya-linux-arm64"
    sha256 "7128c2d4c4670276a309974286c16e3dba37432cfeca00ebddc8c54f06387faf"
  end

  def install
    if OS.mac? && Hardware::CPU.intel?
      bin.install "maya-macos-x86_64" => "maya"
    elsif OS.mac? && Hardware::CPU.arm?
      bin.install "maya-macos-arm64" => "maya"
    elsif OS.linux?
      bin.install "maya-linux-arm64" => "maya"
    end
  end

  test do
    system "#{bin}/maya", "--version"
  end
end
