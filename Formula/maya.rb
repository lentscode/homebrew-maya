class Maya < Formula
  desc "A CLI for developers"
  homepage "https://github.com/lentscode/maya"
  version "0.1.3"

  if OS.mac?
    url "https://github.com/lentscode/maya/releases/download/v#{version}/maya-macos-amd64"
    sha256 "25ce12c669f0324e3104bb3f90f101dd42fea73ba3227462f89e6a01c018a0d0"
  elsif OS.linux?
    url "https://github.com/lentscode/maya/releases/download/v#{version}/maya-linux-amd64"
    sha256 "7128c2d4c4670276a309974286c16e3dba37432cfeca00ebddc8c54f06387faf"
  end

  def install
    if OS.mac?
      bin.install "maya-macos-amd64" => "maya"
    elsif OS.linux?
      bin.install "maya-linux-amd64" => "maya"
    end
  end

  test do
    system "#{bin}/maya", "--version"
  end
end
