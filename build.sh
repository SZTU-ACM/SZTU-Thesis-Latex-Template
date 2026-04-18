#!/usr/bin/env bash
# 从仓库根目录生成 sztuthesis_main.pdf（XeLaTeX + BibTeX）。
# 用法：
#   bash build.sh           # 增量编译（优先 latexmk）
#   bash build.sh --clean   # 先清理辅助文件再全量编译（冷启动等价）
#
# 依赖：TeX Live / MacTeX（含 xelatex、bibtex；推荐同时安装 latexmk）。
#
# 编译顺序说明（无 latexmk、从 0 开始时）：
#   1) xelatex   — 生成 .aux 等，供 bibtex 读 \citation
#   2) bibtex    — 根据 .aux 生成 .bbl
#   3) xelatex   — 读入 .bbl，更新正文引用
#   4) xelatex   — 稳定交叉引用、目录、页码等（多数论文需至少到此）
#   若 log 仍提示 Rerun，可再运行一次 xelatex；latexmk 会自动判断次数。

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"
cd "$ROOT"

MAIN_TEX="sztuthesis_main.tex"
MAIN_BASE="sztuthesis_main"

need_cmd() {
  if ! command -v "$1" >/dev/null 2>&1; then
    printf 'build.sh: 未找到命令 "%s"。请安装 TeX Live（Linux）或 MacTeX（macOS），并确保其 bin 在 PATH 中。\n' "$1" >&2
    exit 1
  fi
}

run_xelatex() {
  xelatex -synctex=1 -interaction=nonstopmode -file-line-error -halt-on-error "$MAIN_TEX"
}

clean_aux() {
  # 不删 .pdf；与 latexmk -C 相比更保守，避免误删用户其它 pdf
  if command -v latexmk >/dev/null 2>&1; then
    latexmk -C -silent "$MAIN_TEX" >/dev/null 2>&1 || true
  fi
  rm -f ./*.aux ./*.bbl ./*.blg ./*.out ./*.toc ./*.lof ./*.lot ./*.fls ./*.fdb_latexmk \
    ./content/*.aux 2>/dev/null || true
  rm -f "./${MAIN_BASE}.log" "./${MAIN_BASE}.synctex.gz" 2>/dev/null || true
}

case "${1:-}" in
  --clean|-c)
    clean_aux
    ;;
  --help|-h)
    sed -n '1,20p' "$0"
    exit 0
    ;;
  "")
    ;;
  *)
    printf '未知参数: %s\n用法: bash build.sh [--clean]\n' "$1" >&2
    exit 2
    ;;
esac

if command -v latexmk >/dev/null 2>&1; then
  need_cmd latexmk
  latexmk -synctex=1 -interaction=nonstopmode -file-line-error -halt-on-error -xelatex "$MAIN_TEX"
  printf 'build.sh: 完成 → %s/%s.pdf\n' "$ROOT" "$MAIN_BASE"
  exit 0
fi

need_cmd xelatex
need_cmd bibtex

run_xelatex
bibtex "$MAIN_BASE"
run_xelatex
run_xelatex

if grep -q 'Rerun to get' "${MAIN_BASE}.log" 2>/dev/null; then
  printf 'build.sh: 检测到需再次运行 xelatex，正在多编译一次…\n'
  run_xelatex
fi

printf 'build.sh: 完成 → %s/%s.pdf\n' "$ROOT" "$MAIN_BASE"
