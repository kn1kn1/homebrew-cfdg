class Cfdg < Formula
  homepage "http://www.contextfreeart.org/"
  url "http://www.contextfreeart.org/download/ContextFreeSource3.0.9.tgz"
  sha256 "5402eda8166e3d0427a6874878400db34daa240d5fb84a00158ac46cbe8d17cb"

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
