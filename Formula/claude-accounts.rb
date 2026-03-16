# typed: false
# frozen_string_literal: true

class ClaudeAccounts < Formula
  desc "Manage multiple Claude Code account configurations"
  homepage "https://github.com/frisble/claude-accounts"
  url "https://github.com/frisble/claude-accounts/archive/refs/tags/1.1.0.tar.gz"
  sha256 "ce20d063f860ea77c7666fab67ea5de8c635064a0a083bf9a3f6f858d65315a3"
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
