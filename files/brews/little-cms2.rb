require 'formula'

class LittleCms2 < Formula
  homepage 'http://www.littlecms.com/'
  url 'http://sourceforge.net/projects/lcms/files/lcms/2.4/lcms2-2.4.tar.gz'
  sha256 'bd9df047d51943acc4bc6cf55d88edb5b6785a53337ee2a0f74dd521aedde87d'

  version '2.4-boxen1'

  option 'with-python', "Build Python bindings"

  depends_on 'jpeg' => :optional
  depends_on 'libtiff' => :optional

  def install
    args = ["--disable-debug", "--prefix=#{prefix}"]
    args << "--with-python" if build.include? "with-python"

    system "./configure", *args
    system "make install"
  end
end
