# Seedance Prompt Writer

一个面向 Seedance 2.0 / Seedance 2.0 Fast 的视频提示词写作 skill。它帮助 AI agent 把粗略想法、参考图、参考视频、音频节奏、广告脚本、短剧桥段、视频续写和视频编辑需求，改写成更适合直接粘贴使用的中文成品提示词。

## 适合做什么

- 文生视频：把一句灵感扩展成完整镜头提示词
- 图生视频：锁定人物、产品、构图、服装、场景和颜色
- 多参考素材：给每张图、每段视频、每段音频分配明确作用
- 视频续写：承接第一帧或最后一帧，保持动作和镜头连续
- 视频编辑：添加、移除、替换或修改已有视频中的元素
- 产品广告：突出卖点、材质、logo、包装和最终展示画面
- 中文短剧：构建冲突钩子、台词、反应镜头和情绪爆点
- 音乐/节奏同步：让画面动作、转场、文字和重拍对应
- 提示词诊断：找出主体、动作、镜头、参考素材和约束中的问题

## 仓库结构

```text
seedance-prompt-writer/
├── SKILL.md
├── AGENTS.md
├── CLAUDE.md
├── GEMINI.md
├── agents/
│   └── openai.yaml
├── evals/
│   ├── README.md
│   └── evals.json
├── examples/
│   └── README.md
├── references/
│   ├── github-resources.md
│   └── prompt-patterns.md
└── scripts/
    └── score_prompt.py
```

`SKILL.md` 是 agent 的入口文件；`references/prompt-patterns.md` 存放更完整的场景模板；`references/github-resources.md` 记录可参考的公开 Seedance prompt 资源。
`examples/` 给人看，`evals/` 和 `scripts/score_prompt.py` 用来维护和回归检查。

## 它不是什么

这个仓库不是 Seedance API 客户端，也不会自动上传素材、调用生成接口、下载视频或替你选择平台套餐。它是一个可复用的 agent skill 和提示词工作流：让 Codex、Claude Code、Gemini CLI 或其他 agent 更稳定地写出 Seedance 2.0 视频提示词。

如果后续要扩展成自动化工具，建议另建一层 CLI，明确处理素材路径、平台 API、鉴权、生成任务轮询、结果下载和人工打分，不要把这些和核心 `SKILL.md` 混在一起。

## 安装

优先用选项 A。脚本只会安装真正运行 skill 需要的文件：`SKILL.md`、`agents/` 和 `references/`，不会把 `.git`、README、examples、evals、scripts 等开源维护文件带进 skill 目录。

### 选项 A：Codex Skill（推荐）

安装后会在所有 Codex 项目里可用。

Windows:

```powershell
irm https://raw.githubusercontent.com/luofeiawyjwj/seedance-prompt-writer/main/install.ps1 | iex
```

macOS / Linux:

```bash
curl -fsSL https://raw.githubusercontent.com/luofeiawyjwj/seedance-prompt-writer/main/install.sh | bash
```

然后在 Codex 里直接说：

```text
用 seedance-prompt-writer 帮我把这个视频想法写成 Seedance 2.0 提示词：雨夜街头，一个女孩回头看向撑伞的男生，电影感，10 秒。
```

或者显式触发：

```text
Use $seedance-prompt-writer 把这段想法优化成中文成品提示词：...
```

### 选项 B：Codex Skill（按项目）

在项目根目录执行，只让当前项目使用这个 skill。

Windows:

```powershell
$env:SEEDANCE_SKILL_SCOPE = "project"; irm https://raw.githubusercontent.com/luofeiawyjwj/seedance-prompt-writer/main/install.ps1 | iex
```

macOS / Linux:

```bash
curl -fsSL https://raw.githubusercontent.com/luofeiawyjwj/seedance-prompt-writer/main/install.sh | bash -s -- codex project
```

### 选项 C：Claude Code Skill

安装后可以在 Claude Code 里用 `/seedance-prompt-writer` 调用。

Windows:

```powershell
$env:SEEDANCE_SKILL_TARGET = "claude"; irm https://raw.githubusercontent.com/luofeiawyjwj/seedance-prompt-writer/main/install.ps1 | iex
```

macOS / Linux:

```bash
curl -fsSL https://raw.githubusercontent.com/luofeiawyjwj/seedance-prompt-writer/main/install.sh | bash -s -- claude
```

使用示例：

```text
/seedance-prompt-writer 帮我写一个 10 秒 9:16 的 Seedance 短剧提示词：女主在电梯里发现男主身份反转。
```

按项目安装到 Claude Code：

```powershell
$env:SEEDANCE_SKILL_TARGET = "claude"; $env:SEEDANCE_SKILL_SCOPE = "project"; irm https://raw.githubusercontent.com/luofeiawyjwj/seedance-prompt-writer/main/install.ps1 | iex
```

macOS / Linux 项目级安装：

```bash
curl -fsSL https://raw.githubusercontent.com/luofeiawyjwj/seedance-prompt-writer/main/install.sh | bash -s -- claude project
```

### 选项 D：不安装，只当项目上下文

适合 Gemini CLI、Cursor 或其他不自动识别 `SKILL.md` 的 agent。

```bash
git clone --depth 1 https://github.com/luofeiawyjwj/seedance-prompt-writer.git
```

然后对 agent 说：

```text
请按 seedance-prompt-writer/SKILL.md 的规则，把我的想法写成 Seedance 2.0 中文成品提示词。需要详细模板时读取 seedance-prompt-writer/references/prompt-patterns.md。
```

## 示例和评测

查看 10 个覆盖主要场景的操作案例：

```bash
cat examples/README.md
```

查看回归评测样例和评分维度：

```bash
cat evals/README.md
```

用轻量脚本检查某个输出提示词是否覆盖关键要素：

```bash
python scripts/score_prompt.py --text "生成一段 10 秒 9:16 视频，主体是..."
```

这个脚本只做启发式检查，不能替代真实 Seedance 生成结果和人工审片。

## 操作示范

### 1. 粗略想法扩写

输入：

```text
帮我写 Seedance 提示词：雨夜咖啡店门口，女生回头，男生撑伞，很电影。
```

输出方向：

```text
生成一段 10 秒 16:9 写实电影感短片。雨夜的街角咖啡店门口，暖黄色店内灯光透过玻璃洒到湿漉漉的人行道上，地面有清晰霓虹倒影。女生穿浅色风衣，刚推门离开咖啡店，走出两步后缓慢回头；男生站在门口外侧，撑着黑伞安静看着她，表情克制、欲言又止。镜头使用中景缓慢推近，从两人之间的雨幕推进到女生回头的侧脸特写。光线为暖室内光与冷蓝雨夜街灯对比，氛围安静、暧昧、带一点遗憾。保持两人的服装、发型和面部特征稳定，雨滴、伞面水珠、玻璃反光自然真实。结尾停在女生眼神微微颤动、男生没有开口的静默瞬间。无字幕、无水印。
```

### 2. 图生视频

输入：

```text
Image 1 是一只白色香水瓶。帮我做 10 秒产品广告，保持瓶身形状和 logo，背景可以高级一点。
```

输出方向：

```text
使用 Image 1 作为产品外观参考，保持白色香水瓶的瓶身轮廓、瓶盖比例、logo 位置和材质细节准确。生成一段 10 秒 16:9 产品广告视频：香水瓶放在浅灰色石材台面上，背景是柔和散焦的高级浴室空间，水汽轻轻漂浮。镜头使用微距特写缓慢环绕，从瓶身侧面移动到正面 logo，再轻轻推近到瓶盖和玻璃反光。光线为干净柔光箱加一束细窄轮廓光，突出瓶身边缘和半透明质感。结尾产品居中，logo 清晰可读，画面保持简洁、真实、无额外文字、无水印。
```

### 3. 多参考素材分工

输入：

```text
Image 1 保持人物长相，Image 2 参考赛博城市，Video 1 参考运镜。生成一个夜晚奔跑镜头。
```

输出方向：

```text
素材分工：Image 1 用于保持角色身份、脸部特征、发型和服装；Image 2 用于参考夜晚赛博城市的霓虹色彩、潮湿街道和建筑背景；Video 1 仅参考镜头运动节奏和跟拍方向，不复制其中的人物或场景。生成一段 10 秒 16:9 写实科幻短片：角色在雨后的赛博城市街道上向前奔跑，身后霓虹招牌和车辆灯光形成长条反射。镜头使用低角度手持跟拍，从角色侧后方贴近移动，跟随奔跑节奏轻微晃动，最后推到角色回头的紧张表情。保持 Image 1 的人物身份、服装和发型稳定，保持 Image 2 的冷蓝与品红霓虹氛围，动作速度和镜头节奏参考 Video 1，画面连续自然。
```

### 4. 提示词诊断和优化

输入：

```text
这个提示词生成效果很乱：一个机器人在城市里飞，镜头酷一点，很多爆炸，电影大片，帮我优化。
```

输出方向：

```text
问题诊断：
主体动作太泛，镜头指令不明确，“很多爆炸”和“酷一点”会让画面元素失控；缺少场景位置、飞行方向、光线和结尾画面。

优化后提示词：
生成一段 10 秒 16:9 写实科幻动作短片。主体是一台银灰色人形机器人，胸口有蓝色能量核心，正在未来城市高楼之间低空高速飞行。镜头使用侧后方高速跟拍，先贴近机器人肩部和推进器火焰，再跟随它穿过两栋玻璃大楼之间的狭窄空隙。远处只有 2 次受控爆炸，爆炸发生在背景建筑侧面，火光照亮玻璃幕墙但不遮挡主体。光线为夜晚城市霓虹与爆炸暖光混合，风格写实、紧张、清晰。保持机器人外形、能量核心颜色和飞行方向稳定，结尾停在机器人冲出烟雾、城市天际线展开的宽景画面。
```

## 维护建议

- `SKILL.md` 保持短而清晰，只放 agent 必须知道的执行规则。
- 详细模板放到 `references/prompt-patterns.md`，让 agent 按需读取。
- 新增能力时同步补 `examples/` 和 `evals/`，用真实输入检查输出稳定性。
- 有真实 Seedance 生成结果后，把短 GIF、截图或视频链接放进 README 的 Demo 区，不要用未验证的假效果图。
- 不要把平台价格、额度、参数上限写死；这些内容变化快，使用前应查当前平台文档。
- 引用社区 prompt 时保留来源和许可证，不要大段复制他人的提示词库。
- 如果增加脚本或自动化工具，先说明用途，再验证它不会读取或上传用户素材。

## 参考文档

- OpenAI Codex customization 文档：https://developers.openai.com/codex/concepts/customization
- Claude Code skills 文档：https://code.claude.com/docs/en/skills
- Claude Code memory / CLAUDE.md 文档：https://code.claude.com/docs/en/memory
- Gemini CLI configuration 文档：https://github.com/google-gemini/gemini-cli/blob/main/docs/cli/configuration.md

## License

MIT
