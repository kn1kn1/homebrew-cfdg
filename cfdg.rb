class Cfdg < Formula
  homepage "https://www.contextfreeart.org/"
  url "https://www.contextfreeart.org/download/ContextFreeSource3.0.10.tgz"
  sha256 "4c2606e7c89e9aa60c186a26e8fa0aa7b25a97f46e93cb0ec9e954c0ae6b816e"

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
