#!/usr/bin/env bash
set -euo pipefail

target="${1:-${SEEDANCE_SKILL_TARGET:-codex}}"
scope="${2:-${SEEDANCE_SKILL_SCOPE:-global}}"
raw_base="https://raw.githubusercontent.com/luofeiawyjwj/seedance-prompt-writer/main"
skill_name="seedance-prompt-writer"

case "$target" in
  codex|claude) ;;
  *) echo "target must be codex or claude" >&2; exit 2 ;;
esac

case "$scope" in
  global|project) ;;
  *) echo "scope must be global or project" >&2; exit 2 ;;
esac

if [ "$target" = "claude" ]; then
  if [ "$scope" = "project" ]; then
    root=".claude/skills"
  else
    root="$HOME/.claude/skills"
  fi
else
  if [ "$scope" = "project" ]; then
    root=".agents/skills"
  else
    root="$HOME/.agents/skills"
  fi
fi

dst="$root/$skill_name"
rm -rf "$dst"
mkdir -p "$dst/agents" "$dst/references"

curl -fsSL "$raw_base/SKILL.md" -o "$dst/SKILL.md"
curl -fsSL "$raw_base/agents/openai.yaml" -o "$dst/agents/openai.yaml"
curl -fsSL "$raw_base/references/prompt-patterns.md" -o "$dst/references/prompt-patterns.md"
curl -fsSL "$raw_base/references/github-resources.md" -o "$dst/references/github-resources.md"

echo "Installed $skill_name for $target ($scope): $dst"
