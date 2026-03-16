# typed: false
# frozen_string_literal: true

class ClaudeAccounts < Formula
  desc "Manage multiple Claude Code account configurations"
  homepage "https://github.com/frisble/claude-accounts"
  url "https://github.com/frisble/claude-accounts/archive/refs/tags/1.1.0.tar.gz"
  sha256 "f4edb089f7ba7273618594c40ec17d906e72a4595e6bf8c4a4209b38927f2890"
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
