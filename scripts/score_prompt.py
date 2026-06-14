#!/usr/bin/env python3
"""Lightweight heuristic scorer for Seedance prompt drafts.

This is a maintenance helper, not a substitute for human review or real video
generation tests.
"""

from __future__ import annotations

import argparse
import json
import re
from dataclasses import dataclass


@dataclass(frozen=True)
class Check:
    name: str
    patterns: tuple[str, ...]
    weight: int = 2


CHECKS = (
    Check("subject", ("主体", "人物", "角色", "产品", "主角")),
    Check("action", ("动作", "正在", "缓慢", "走", "跑", "推近", "替换", "延展")),
    Check("scene", ("场景", "背景", "街", "室内", "城市", "海边", "店", "桌面")),
    Check("camera", ("镜头", "固定", "推近", "跟拍", "环绕", "特写", "手持")),
    Check("lighting", ("光线", "灯光", "柔光", "逆光", "霓虹", "自然光")),
    Check("continuity", ("保持", "一致", "稳定", "不变", "连续")),
    Check("final_frame", ("结尾", "最终", "停在", "收束")),
    Check("reference_mapping", ("Image", "Video", "Audio", "参考", "素材分工"), 1),
    Check("safety", ("原创", "不能", "不复制", "替代", "避免"), 1),
)


def score_text(text: str) -> dict[str, object]:
    normalized = re.sub(r"\s+", "", text)
    results = []
    total = 0
    max_score = sum(check.weight for check in CHECKS)

    for check in CHECKS:
        matched = any(pattern in normalized for pattern in check.patterns)
        points = check.weight if matched else 0
        total += points
        results.append(
            {
                "name": check.name,
                "matched": matched,
                "points": points,
                "max": check.weight,
                "patterns": check.patterns,
            }
        )

    return {
        "score": total,
        "max_score": max_score,
        "pass": total >= 12,
        "checks": results,
    }


def main() -> None:
    parser = argparse.ArgumentParser(description="Score a Seedance prompt draft with simple heuristics.")
    parser.add_argument("--text", help="Prompt text to score.")
    parser.add_argument("--file", help="UTF-8 text file containing the prompt to score.")
    args = parser.parse_args()

    if not args.text and not args.file:
        parser.error("provide --text or --file")

    if args.file:
        with open(args.file, "r", encoding="utf-8") as handle:
            text = handle.read()
    else:
        text = args.text or ""

    print(json.dumps(score_text(text), ensure_ascii=False, indent=2))


if __name__ == "__main__":
    main()
