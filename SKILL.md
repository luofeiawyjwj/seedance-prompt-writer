---
name: seedance-prompt-writer
description: Write, expand, optimize, translate, critique, and iterate prompts for Seedance 2.0 or Seedance 2.0 Fast video generation, including text-to-video, image-to-video, reference-to-video, video-to-video, video editing, product ads, cinematic shots, social clips, character-consistent scenes, camera movement, lighting, audio-aware scenes, multimodal references, and prompt debugging. Use when the user mentions Seedance, Seedance 2.0, Dreamina Seedance, ByteDance Seedance, or asks for AI video prompts for this model.
---

# Seedance Prompt Writer

## Workflow

Start from the user's intent and produce a usable Seedance 2.0 prompt, not a generic writing exercise.

1. Identify the generation mode: text-to-video, image-to-video, reference-to-video, video-to-video, editing, extension, or unknown.
2. Extract or infer the core brief: subject, action, setting, mood, camera, lighting, style, duration/aspect ratio if known, reference assets, and must-keep details.
3. Ask at most three concise questions only when a missing detail would change the creative direction. Otherwise state assumptions and continue.
4. Compose the prompt as clear natural-language direction. Prefer concrete visual instructions over abstract adjectives.
5. Include one primary camera movement unless the user asks for multi-shot structure.
6. Add constraints positively: say what must remain consistent or visible instead of relying on negative prompts.
7. Return the final prompt first. Then include a short note with assumptions or optional variants when useful.

## Mode Decision

Use these cues to identify the generation mode:

- No source assets: text-to-video.
- Image assets only: image-to-video, unless the image is only a style/composition reference for a broader reference-to-video prompt.
- Video assets used as motion, rhythm, camera, transition, or effect reference: reference-to-video.
- Video assets used as the base clip to transform overall style, subject, environment, or motion while preserving clip continuity: video-to-video.
- Existing video plus add/remove/replace/modify request: editing.
- Existing video plus "continue", "extend", "add more seconds", "接着往后", or "补前面": extension.
- Audio assets or music timing request: audio-aware or beat-sync prompt; map audio to rhythm, mood, voice, or sound effects.

## Prompt Formula

Use this base structure for most requests:

```text
[生成模式与参考素材角色，如有].
主体：[谁/什么，身份，关键外观].
动作：[具体动作、变化或互动].
场景：[环境、时间、背景细节].
镜头：[一个主要镜头运动，必要时写景别/角度].
光线与氛围：[光源、明暗、情绪].
风格：[写实电影感、动画、UGC、产品展示、短剧等].
声音/文字：[对白、环境声、音乐、字幕或屏幕文字].
连续性约束：[保持身份、产品形状、logo、服装、构图、颜色、节奏].
输出意图：[时长、画幅、平台、节奏、结尾画面].
```

These labels are internal structure. For a single ready-to-paste prompt, collapse them into one coherent Chinese paragraph unless the user asks for a structured prompt.

## Reference Handling

When the user provides or describes reference assets, explicitly map each asset to its job:

- Image reference: preserve character identity, product design, composition, color palette, outfit, or background.
- Video reference: follow action, rhythm, camera path, effect, transition, or scene continuity.
- Audio reference: follow mood, beat timing, dialogue, ambience, or sync.

Use asset names such as `Image 1`, `Video 1`, or the user's filenames. Do not vaguely say "use the reference"; specify what to borrow and what to preserve.

## Output Patterns

For rough ideas, return:

```text
成品提示词：
[可直接粘贴的中文提示词]

假设说明：
[1-3 条简短备注，仅在需要时提供]

可选变体：
[2-3 个变体，仅在有价值时提供]
```

For prompt improvement, return:

```text
优化后提示词：
[重写后的中文提示词]

修改说明：
[说明主体、动作、镜头、光线、参考素材或约束的具体改进]
```

For troubleshooting weak generations, diagnose likely prompt problems before rewriting:

- 主体和动作关系不清楚
- 镜头指令过多或互相冲突
- 动作词太模糊，缺少可观察细节
- 参考素材没有明确分工
- 没有声明角色、产品或场景的一致性
- 光线和风格堆叠太多同义词
- 屏幕文字的出现时间、位置或样式不明确

## Style Rules

- Prefer visual direction: observable actions, positions, materials, light, timing, and camera behavior.
- Keep the main prompt compact for simple clips; expand only for multi-shot, ads, or strict continuity.
- Use Chinese by default for ready-to-paste prompts unless the user asks for English or bilingual output. When a reference template is written in English, translate the final operational prompt into natural Chinese.
- Preserve the user's creative taste. Do not over-cinematic everything if the brief is UGC, meme, documentary, tutorial, product demo, or casual social content.
- Avoid prompts that depend on unauthorized celebrity likenesses, living-person impersonation, or protected characters. Offer a generic substitute style or original character direction.

## Seedance 2.0 Fast

Treat Seedance 2.0 Fast as using the same core prompt logic unless current platform documentation says otherwise. For Fast mode or quick iteration, simplify the prompt:

- Use one clear subject, one main action, one scene, one camera move, and one lighting plan.
- Prefer 1 continuous shot or 2-3 short timeline beats over dense multi-shot scripts.
- Keep only the constraints that protect the result: identity, product shape, logo, outfit, composition, text timing, or final frame.
- Move optional style flourishes, long backstory, and secondary actions into variants instead of the main prompt.

## Example

Before:

```text
雨夜，一个女生在咖啡店门口回头，男生撑伞看着她，想要电影感。
```

After:

```text
成品提示词：
生成一段 10 秒 16:9 写实电影感短片。雨夜的街角咖啡店门口，暖黄色店内灯光透过玻璃洒到湿漉漉的人行道上，地面有清晰霓虹倒影。女生穿浅色风衣，刚推门离开咖啡店，走出两步后缓慢回头；男生站在门口外侧，撑着黑伞安静看着她，表情克制、欲言又止。镜头使用中景缓慢推近，从两人之间的雨幕推进到女生回头的侧脸特写。光线为暖室内光与冷蓝雨夜街灯对比，氛围安静、暧昧、带一点遗憾。保持两人的服装、发型和面部特征稳定，雨滴、伞面水珠、玻璃反光自然真实。结尾停在女生眼神微微颤动、男生没有开口的静默瞬间。无字幕、无水印。
```

## When More Detail Is Needed

Read `references/prompt-patterns.md` when the task needs examples, output specs, video-to-video, video extension, multi-shot structure, reference mapping, multimodal asset roles, short drama, audio sync, text-in-video guidance, ad formulas, genre/scenario routing, camera/effect replication, one-take prompts, story completion, emotion performance, or iteration checklists.

Read `references/github-resources.md` when improving this skill, adding new templates, comparing external Seedance prompt strategies, or citing public prompt libraries.
