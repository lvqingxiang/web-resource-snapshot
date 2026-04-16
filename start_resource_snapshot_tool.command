#!/bin/zsh
cd "$(dirname "$0")"

if python -c "import flask, playwright" >/dev/null 2>&1; then
  PYTHON_BIN="python"
elif python3 -c "import flask, playwright" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
else
  echo "没有找到已安装 Flask 和 Playwright 的 Python 环境。"
  echo "请先运行："
  echo "  python -m pip install -r requirements.txt"
  echo "  playwright install chromium"
  read -k 1 "?按任意键退出..."
  echo
  exit 1
fi

"$PYTHON_BIN" app.py
