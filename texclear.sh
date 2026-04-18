#!/usr/bin/env bash
# 清理 LaTeX / BibTeX 等辅助文件：以 .gitignore 为单一事实来源（与仓库忽略策略一致）。
#
# 在 Git 仓库内：使用 `git clean -X`，由 Git 按 .gitignore 解析要删的路径（比手写 find 规则更通用）。
# 非 Git 目录：回退为逐条读取 .gitignore 中的简单 glob，用 find 删除（不支持 ! 否定等复杂规则）。
#
# 注意：git clean -X 会删除「已被跟踪规则忽略、且当前未纳入版本库」的文件；请勿把仍需保留的本地文件写进 .gitignore。

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"
cd "$ROOT"

GITIGNORE="${ROOT}/.gitignore"

if [[ ! -f "$GITIGNORE" ]]; then
  printf 'texclear.sh: 未找到 .gitignore，中止。\n' >&2
  exit 1
fi

cleanup_via_git() {
  git clean -X -fd -q
  printf '已按 .gitignore 清理（git clean -X -fd）。\n'
}

# 非 git：仅处理「整行即 glob」的常见写法，避免误解析带斜杠的复杂规则
cleanup_via_find() {
  local line base
  while IFS= read -r line || [[ -n "$line" ]]; do
    case "$line" in
      ''|\#*|\!*) continue ;;
    esac
    # 去掉行尾注释（# 前须有空格，减少与路径中 # 的冲突）
    if [[ "$line" =~ [[:space:]]+# ]]; then
      line="${line%%[[:space:]]+#*}"
      line="${line%"${line##*[![:space:]]}"}"
    fi
    [[ -z "$line" ]] && continue

    if [[ "$line" == /* ]]; then
      base="${line#/}"
      find "$ROOT" -maxdepth 1 -type f -name "$base" -delete 2>/dev/null || true
    else
      find "$ROOT" -type f -name "$line" -delete 2>/dev/null || true
    fi
  done <"$GITIGNORE"
  printf '已按 .gitignore 逐条 find 清理（非 Git 仓库回退模式）。\n'
}

if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  cleanup_via_git
else
  cleanup_via_find
fi
