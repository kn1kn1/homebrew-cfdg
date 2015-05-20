class Cfdg < Formula
  homepage "http://www.contextfreeart.org/"
  url "http://www.contextfreeart.org/download/ContextFreeSource3.0.9.tgz"
  sha1 "9966c4a7e719402c59ac078236144f43c2507be2"

  depends_on "bison" => :build
  depends_on "libpng"

  def install
    system "make"
    bin.install "cfdg"
  end

  test do
    (testpath/"test.cfdg").write <<-EOS.undent
    startshape SPIKE

    CF::Symmetry = CF::Dihedral, 6

    shape SPIKE
    rule {
      SQUARE []
      SPIKE [y 0.95 s 0.97]
    }
    rule 0.03 {
      SQUARE []
      SPIKE [r 60]
      SPIKE [r -60]
      SPIKE [y 0.95 s 0.97]
    }
    EOS
    system "cfdg", "-s", "700", "test.cfdg", "test.cfdg.png"
  end
end
