# Seedance 2.0 Prompt Patterns

Use these patterns when a Seedance 2.0 task needs more than the base formula in `SKILL.md`. Patterns are internal scaffolds; return ready-to-paste prompts in natural Chinese unless the user asks otherwise.

## Common Output Specs

Use concrete values when the user leaves specs open:

- 时长：5 秒用于快速测试，10 秒用于普通短片，15 秒用于完整分镜或广告叙事。单次可选范围以当前平台/API 为准；常见文档多见 4-15 秒区间。
- 画幅：16:9 用于横屏、电影感、展示页；9:16 用于抖音/快手/Reels/TikTok；1:1 用于方形社媒；4:3、3:4、21:9 仅在用户明确要复古、竖构图或超宽银幕时使用。
- 默认建议：普通中文用户未指定时，先用 `10 秒 16:9`；短视频平台内容优先 `10 秒 9:16`；产品广告优先 `10 秒 16:9` 或用户指定平台画幅。

## Text-to-Video

Use when the user has only an idea and no source assets.

```text
生成一段 [时长] [画幅] 视频。主体是 [主体]，正在 [具体动作]，场景位于 [环境/时间/天气]。
镜头使用 [一个主要镜头运动]，重点呈现 [关键视觉细节]。
光线为 [光源/光质]，整体氛围 [情绪]。
风格为 [写实电影感/动画/UGC/产品展示/纪录片/短剧]。
全片保持 [身份/服装/产品形状/颜色] 稳定，结尾停在 [明确收束画面]。
```

## Image-to-Video

Use when one or more images should anchor identity, product shape, composition, outfit, color, or scene.

```text
使用 Image 1 作为 [主体身份/产品外观/构图/场景] 参考。
让 [主体/产品] 进行 [具体动作或变化]，同时保持 [脸部/产品轮廓/logo/服装/颜色/构图] 与 Image 1 一致。
镜头使用 [缓慢推进/横向跟拍/手持跟随/固定镜头/环绕展示]。
背景延续 Image 1 的 [场景/色彩/光线]，只允许新增 [允许变化]。
光线保持 [具体光线]，风格为 [风格]。
```

## Reference-to-Video

Use when several assets provide different controls instead of becoming the base video.

```text
使用 Image 1 保持 [角色身份/服装/产品形状]。
使用 Image 2 参考 [环境/色彩/构图]。
使用 Video 1 仅参考 [动作节奏/镜头运动/转场/特效]，不要复制 Video 1 中不需要的主体。
生成一段 [时长] [画幅] 视频：[主体] 在 [场景] 中 [动作]。
在套用 Video 1 的 [运动/节奏] 时，保持 [必须稳定的身份、产品、场景、颜色]。
```

## Video-to-Video

Use when the user provides a base video and wants the whole clip transformed, restyled, re-composed, or transferred while preserving video continuity.

```text
以 Video 1 为基础视频，保留原视频的 [镜头节奏/主体运动/大致构图/时间连续性]。
将画面转换为 [新风格/新场景/新主体设定]，让 [主体] 在同样的运动节奏下 [新的视觉表现或剧情]。
保持原视频的 [镜头方向、运动速度、动作起伏、主要构图] 连贯自然。
新画面需要匹配 [光线、材质、色彩、环境细节]，避免出现突兀跳变。
结尾延续 Video 1 的运动逻辑，停在 [新的最终画面]。
```

Use video-to-video rather than editing when the request is global transformation. Use editing when the user targets a specific object, person, time range, or element.

## Video Editing

Use when the user wants to modify an existing clip by adding, removing, replacing, or changing a target element.

```text
编辑 Video 1：在 [时间点/画面区域] 将 [目标元素] [添加/移除/替换/修改] 为 [新元素或新状态]。
保持原视频的镜头运动、光线方向、场景布局、主体身份和时间连续性不变。
新元素应当 [外观、位置、互动方式、出现时机]。
让新元素自然融入原片，匹配阴影、反射、运动模糊、景深和色彩。
```

## Video Extension

Use when the user wants to continue or prepend an existing video. The requested duration is the newly generated segment duration, not the total final duration, unless the platform says otherwise.

```text
将 Video 1 [向后延展/向前补全] [新增时长]。
延展从原视频 [最后一帧/第一帧] 的状态开始：[描述当前主体姿态、场景、镜头方向、光线、情绪]。
[0-X 秒]：承接原视频动作，[主体] 继续 [动作]，镜头保持 [原镜头运动或自然延续方式]。
[X-Y 秒]：发生 [新增动作/情绪变化/剧情推进]，保持 [身份/服装/产品/场景] 与 Video 1 一致。
[Y-N 秒]：收束到 [最终画面]。
保持原视频的画面风格、光线、色彩、镜头速度、环境声和运动连续性，不要出现明显断层。
```

For backward extension, describe the state that leads into the first frame, then ask the ending of the generated segment to match Video 1's first frame.

## Multi-Shot Structure

Use only when the user asks for storytelling, ads, trailers, or a sequence. Keep each shot short and distinct.

```text
生成一段 [时长] [画幅] 视频，共 [镜头数] 个镜头。
镜头 1（0-X 秒）：[建立场景/主体/动作]，镜头 [运动]。
镜头 2（X-Y 秒）：[更近的动作或细节]，镜头 [运动]。
镜头 3（Y-N 秒）：[反转/高潮/收束画面]，镜头 [运动]。
全片保持 [角色/产品/风格/色彩] 一致。
光线：[统一光线方案]。
声音：[音乐/环境声/对白/音效节奏]。
```

## Short Drama

Use for Chinese short drama, emotional reversal, dialogue scenes, social hooks, and vertical story clips.

```text
生成一段 [时长] [画幅] 中文短剧风格视频，节奏紧凑，情绪强。
人物：[人物 A 身份/外观/状态]，[人物 B 身份/外观/状态]。
场景：[地点/时间/氛围]。
0-3 秒：用 [冲突动作/视觉钩子] 开场，[人物 A] 说：「[短台词]」。
3-8 秒：[人物 B] 做出 [反应/反转动作]，镜头切到 [近景/特写/过肩]，台词：「[短台词]」。
8-[N] 秒：情绪爆点，[关键道具/真相/身份反转] 出现，人物表情 [具体微表情]。
声音：环境声 [雨声/人群/脚步/电话铃]，配乐从 [情绪] 转为 [情绪]。
如需字幕，只显示用户指定台词，字幕位置 [底部居中/画面安全区]，保持清晰不遮挡脸部。
```

## Product Ad

```text
生成一段 [时长] [画幅] 产品广告视频，主角是 [产品]。
使用 [参考素材] 保持产品的形状、颜色、材质、logo 位置和包装细节准确。
场景：[符合购买场景或品牌调性的环境]。
动作：[产品使用/揭示/旋转/开箱/功能展示]。
镜头：[一个主要镜头运动]，重点特写 [产品卖点]。
光线：[高级柔光箱/自然窗光/轮廓光/电商棚拍光]。
结尾：产品居中，出现 [标语/卖点/行动号召，如用户提供]。
```

## Audio Sync

Use when the user provides audio, requests rhythm matching, wants dialogue, or asks for music-video style timing.

```text
使用 Audio 1 作为 [音乐节奏/对白语气/环境氛围/音效] 参考。
画面节奏跟随 Audio 1：在 [鼓点/重拍/歌词关键词/音效出现] 时发生 [动作、转场、特写或文字出现]。
[0-X 秒]：音乐 [情绪/节奏]，画面 [动作]，镜头 [运动]。
[X-Y 秒]：节奏增强或情绪变化，画面 [动作升级/转场]。
[Y-N 秒]：在最后一个重拍或尾音处收束到 [最终画面]。
如果有对白，写清说话人、台词、语气、停顿和口型自然程度。环境声与画面一致，不要压过对白。
```

For music videos, keep visual changes tied to audible beats. For dialogue scenes, prioritize intelligibility and emotional performance over dense background music.

## Text In Video

Specify content, timing, position, and style. Use common characters and simple wording.

```text
在 [时间点/镜头] 添加屏幕文字「[准确文字]」。
文字位于 [位置]，通过 [淡入/打字/弹出/上滑] 出现。
文字样式：[颜色、字重、字体感觉、描边或阴影]。
文字保持清晰可读，不遮挡脸部、产品或关键动作。
```

## Multimodal Asset Roles

Use this when users provide several images, videos, or audio clips. Assign each asset a job before writing the final prompt.

- Identity anchor: face, character design, outfit, product shape, logo, package, or material.
- Scene anchor: background, architecture, color palette, lighting, weather, time period, or composition.
- Motion anchor: action rhythm, gesture, dance move, chase pattern, object interaction, or camera path.
- Style anchor: animation style, realism level, genre tone, texture, color grading, or VFX treatment.
- Audio anchor: beat, tempo, vocal emotion, dialogue delivery, ambient sound, or sound-effect timing.
- Continuity anchor: first frame, last frame, camera direction, subject position, scene layout, or temporal flow.

```text
素材分工：Image 1 保持 [角色/产品身份]；Image 2 参考 [场景/色彩/构图]；Video 1 只参考 [动作/镜头/转场/特效]；Audio 1 参考 [节奏/对白/氛围]。
生成一段 [时长] [画幅] 视频：[主体] 在 [场景] 中 [动作]。
套用参考素材时，保持 [必须稳定的身份、产品、场景、颜色、镜头方向]，不要复制参考素材中无关的人物、品牌或背景。
```

## Camera And Action Replication

Use when the user asks to copy a reference video's movement, choreography, transition, or camera language.

```text
使用 Video 1 仅参考 [镜头运动/动作节奏/转场方式]。
新画面主体是 [主体]，场景改为 [新场景]，动作按 Video 1 的节奏分为 [起势/加速/停顿/收束]。
镜头保持 [跟拍/环绕/推近/拉远/俯冲/手持] 的运动逻辑，但画面中的人物、服装、背景和道具替换为当前设定。
保持动作力度、速度变化、运动方向和重心转移自然连贯，结尾停在 [明确最终姿态或画面]。
```

Prefer this over generic "make it like the video" instructions. If the reference contains protected characters, celebrities, or brands, borrow only motion, rhythm, composition, or visual grammar.

## Creative Effect Replication

Use when the user wants a transformation, portal, freeze-frame, liquid, smoke, glitch, split-screen, miniature, macro, or surreal effect.

```text
生成一段 [时长] [画幅] 创意特效视频。
主体：[主体] 从 [初始状态] 逐步变化为 [结果状态]。
特效过程：[0-X 秒] [触发点]；[X-Y 秒] [材质/光线/粒子/形变如何展开]；[Y-N 秒] [稳定到最终形态]。
镜头使用 [一个主要镜头运动]，始终让 [主体关键部位] 清晰可见。
特效需要匹配场景光线、阴影、反射、运动模糊和景深，变化过程连续，不突然跳切。
声音：[能量声/环境声/重拍/静音反差] 与变化节奏同步。
```

Use concrete physical descriptions: sparks scatter, ink diffuses, glass refracts, fabric folds, neon flickers. Avoid stacking vague style words.

## One Continuous Shot

Use when the user asks for "一镜到底", no cuts, path traversal, walkthroughs, or continuous performance.

```text
生成一段 [时长] [画幅] 一镜到底视频，全程无剪切。
镜头从 [起点景别/位置] 出发，沿 [路径] 经过 [节点 A]、[节点 B]、[节点 C]，最终停在 [终点画面]。
主体在镜头运动中持续 [动作/互动]，每个空间节点自然衔接，不能出现跳变、穿帮或突然换场。
镜头运动为 [手持跟随/稳定器推进/环绕/穿越空间/俯冲拉升]，速度从 [慢/中/快] 变化到 [慢/中/快]。
保持光线方向、空间关系、角色身份、服装、产品外观和声音环境连续。
```

Keep the route short enough for the requested duration. If the user asks for many locations, compress to 3-4 visual beats.

## Story Completion

Use when the user provides a beginning, image, or clip and asks to continue the story rather than merely extend motion.

```text
承接 [Image/Video 1] 的人物状态、场景和情绪，生成 [时长] [画幅] 后续剧情。
[0-X 秒]：从参考素材的当前状态自然开始，[主体] 做出 [延续动作]。
[X-Y 秒]：出现 [新信息/冲突/反转/互动]，推动情绪从 [情绪 A] 变化为 [情绪 B]。
[Y-N 秒]：用 [动作/表情/道具/镜头] 收束到 [明确结尾画面]。
保持人物身份、服装、场景布局、光线、声音氛围和镜头方向一致。
```

Distinguish story completion from video extension: story completion adds narrative change; extension preserves the original motion and continuity more tightly.

## Emotion Performance

Use when the result depends on subtle acting, dialogue, eye contact, hesitation, fear, surprise, or romance.

```text
生成一段 [时长] [画幅] 情绪表演视频。
人物：[身份/外观/当前心理状态]。
场景：[地点/时间/环境声]。
表演节奏：[0-X 秒] [克制动作和眼神]；[X-Y 秒] [情绪变化触发点]；[Y-N 秒] [微表情/停顿/呼吸/手部动作]。
镜头使用 [近景/中近景/过肩/缓慢推进]，重点捕捉眼神、嘴角、呼吸、手指或身体重心变化。
对白如有：写清说话人、台词、语气、停顿和口型自然度。无对白时，用环境声和动作表达情绪。
```

Use small observable details instead of labels such as "very sad" or "cinematic emotion".

## Genre Router

Pick one dominant genre. Do not combine more than two unless the user explicitly asks.

- Cinematic action: 10-15s, 2-4 beats, strong physical stakes, precise camera, sound effects tied to impact.
- Product commercial: product identity first, material/logo accuracy, use-case action, clean light, final packshot or CTA.
- UGC or vlog: handheld or phone-like framing, natural light, casual speech, imperfect timing, platform-native 9:16.
- Short drama: vertical framing, conflict hook in first 2-3s, dialogue, reaction close-ups, emotional reversal.
- Anime or stylized animation: character model consistency, expressive poses, line/color style, controlled effects.
- Music video or dance: Audio 1 as rhythm anchor, beat-matched movement, clear body silhouette, no overcrowded camera moves.
- Science or education: visible process, labels only when needed, stable camera, step-by-step reveal, no distracting spectacle.
- VFX or surreal: one clear transformation/effect, physical continuity, material behavior, matching light and shadows.
- Travel or environment: establishing movement, weather/time-of-day, spatial continuity, ambient sound, final scenic hold.
- Food or craft: macro details, hand motion, texture, steam/liquid/material behavior, overhead or close tracking shot.

## Camera Menu

Use one primary movement for simple prompts:

- 固定镜头：稳定干净，适合产品、转化、对话。
- 缓慢推进：适合揭示、情绪加强、结尾特写。
- 横向跟拍：适合行走、车辆、产品移动。
- 环绕镜头：适合展示产品或角色造型。
- 手持跟随：适合 UGC、纪录片、追逐、街头真实感。
- 俯拍：适合美食、手作、桌面演示。
- 微距特写：适合材质、食物、产品细节。
- 低角度仰拍：适合英雄感、机甲、建筑、舞台登场。
- 高速追拍：适合赛车、运动、追逐，但要明确主体方向和安全构图。
- 拉远揭示：适合环境规模、反转、产品场景化展示。
- 穿越镜头：适合一镜到底、空间探索，需明确路径和终点。

## Lighting Menu

Use one lighting plan:

- 柔和自然窗光
- 金色夕阳逆光
- 阴天漫反射日光
- 霓虹城市光与地面反射
- 棚拍柔光箱与干净阴影
- 戏剧化轮廓光
- 烛光或火光等实景光源
- 明亮电商产品光
- 舞台聚光与暗背景
- 清晨薄雾逆光
- 科幻冷白屏幕光
- 彩色音乐现场灯光

## Sound Menu

Use sound only when it changes the result.

- 环境声：雨声、脚步、人群、风声、机器声、城市低频。
- 动作声：布料摩擦、玻璃碎裂、金属碰撞、水花、引擎、刹车。
- 情绪声：轻呼吸、停顿、电话忙音、远处音乐、心跳低频。
- 广告声：产品开合声、气泡声、清脆点击、结尾品牌音效。
- 音乐节奏：鼓点、重拍、drop、尾音、歌词关键词。

## Iteration Checklist

If the user is unhappy with a generation, rewrite by tightening:

1. 主体身份和必须保持的特征
2. 一个清晰动作，避免多个动作互相抢指令
3. 一个主要镜头运动
4. 明确环境和光线
5. 每个参考素材的具体角色
6. 正向连续性约束
7. 清晰最终画面
8. 时长内只保留一个主要叙事目标或特效目标
9. 对话、字幕和屏幕文字的位置、时机、样式
10. 声音与动作或情绪变化的同步点
