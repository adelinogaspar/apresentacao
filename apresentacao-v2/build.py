#!/usr/bin/env python3
"""build.py — embute as artes SVG (base64) no template e gera index.html.

    python3 build.py
"""
import base64
from pathlib import Path

HERE = Path(__file__).parent
ART = {"bat": "art/bat.svg", "cat": "art/cat.svg", "pumpkin": "art/pumpkin.svg", "threads": "art/threads.svg"}


def data_uri(path: Path) -> str:
    return "data:image/svg+xml;base64," + base64.b64encode(path.read_bytes()).decode()


def main() -> None:
    html = (HERE / "template.html").read_text(encoding="utf-8")
    for name, path in ART.items():
        html = html.replace("{{" + name + "}}", data_uri(HERE / path))
    out = HERE / "index.html"
    out.write_text(html, encoding="utf-8")
    print(f"{out} gerado ({len(html) // 1024} KB, 10 slides, imagens embutidas)")


if __name__ == "__main__":
    main()
