class DeepseekHarness < Formula
  desc "Plugin-based agent harness developed by DeepSeek"
  homepage "https://deepseek.com/harness/"
  url "https://registry.npmjs.org/@deepseek-ai/dsh/-/dsh-0.2.1-rc.2.tgz"
  sha256 "40e3d025c0240c4316ff42dee9bedc7709c0fb38aea10543b47076ed2af52e1d"
  license "MIT"

  livecheck do
    url "https://registry.npmjs.org/@deepseek-ai/dsh/latest"
    strategy :json do |json|
      json["version"]
    end
  end

  depends_on "node"
  depends_on "pnpm"

  conflicts_with "dsh", because: "both install a `dsh` executable"

  def install
    system "npm", "install", *std_npm_args

    platform = OS.mac? ? "darwin" : "linux"
    arch = Hardware::CPU.arm? ? "arm64" : "x64"
    libexec.glob("lib/node_modules/**/node-pty/prebuilds/*").each do |prebuild|
      rm_r prebuild if prebuild.basename.to_s != "#{platform}-#{arch}"
    end

    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    ENV["DSH_HOME"] = testpath/"dsh-home"

    assert_equal version.to_s, shell_output("#{bin}/dsh --version").strip

    output = shell_output("#{bin}/dsh --profile headless --dump-default-config")
    assert_match "@deepseek-ai/dsh-headless", output
  end
end
