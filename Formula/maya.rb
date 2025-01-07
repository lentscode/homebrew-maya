class Maya < Formula
  desc "A CLI for developers"
  homepage "https://github.com/lentscode/maya"
  version "0.1.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/lentscode/maya/releases/download/v#{version}/maya-macos-x86_64"
    sha256 "34e6957aa116ff180936585ce980e62913f3628ba967032ceaf344249ca77ae0"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/lentscode/maya/releases/download/v#{version}/maya-macos-arm64"
    sha256 "0c399cf94b27d26a34e3579798faca286f54bdaa1cc6d12b4417c31de5949d92"
  elsif OS.linux?
    url "https://github.com/lentscode/maya/releases/download/v#{version}/maya-linux-arm64"
    sha256 "9c78b5cdc3d816d5619f13c602e007196da097edcbae3256740d101be7f0bad7"
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
