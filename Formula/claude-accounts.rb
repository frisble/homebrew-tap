# typed: false
# frozen_string_literal: true

class ClaudeAccounts < Formula
  desc "Manage multiple Claude Code account configurations"
  homepage "https://github.com/frisble/claude-accounts"
  url "https://github.com/frisble/claude-accounts/archive/refs/tags/1.1.1.tar.gz"
  sha256 "abdea84470374bf59b3db2f9b01546fa417178dcf56364fd3dcd68ee3fd15b0b"
  license "MIT"
  head "https://github.com/frisble/claude-accounts.git", branch: "main"

  def install
    bin.install "bin/claude-accounts"
  end

  def caveats
    <<~EOS
      Quick start:
        claude-accounts add work      # Create 'work' account
        claude-work                   # Launch Claude with 'work' account

      For more information:
        claude-accounts help
    EOS
  end

  test do
    assert_match "claude-accounts #{version}", shell_output("#{bin}/claude-accounts version")
    assert_match "Configured Claude accounts:", shell_output("#{bin}/claude-accounts list 2>&1", 0)
  end
end
