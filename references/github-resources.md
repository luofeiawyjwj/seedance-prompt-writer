# GitHub Resources For Seedance Prompt Writing

Use this file when improving the skill or looking for public examples. Prefer extracting patterns, taxonomies, and failure modes instead of copying large prompt collections verbatim.

## High-Value Repositories

### dexhunter/seedance2-skill

URL: https://github.com/dexhunter/seedance2-skill

Best use:
- Compare simple Claude-style skill packaging and bilingual English/Chinese instruction files.
- Mine high-frequency scene names: camera replication, effect replication, video extension, video editing, music sync, ecommerce ads, short drama, science education, one-take videos, and video fusion.
- Use as a compact checklist for missing scenario coverage, not as the main architecture.

Notes:
- Publicly popular lightweight Seedance 2.0 skill with a small commit history.
- Treat its platform claims and linked official docs as time-sensitive; verify before citing parameter limits.
- Prefer extracting scenario taxonomy and prompt heuristics instead of copying the full skill text.

### YouMind-OpenLab/awesome-seedance-2-prompts

URL: https://github.com/YouMind-OpenLab/awesome-seedance-2-prompts

Best use:
- Mine broad prompt categories and recent community styles.
- Study how successful prompts encode duration, shot timing, camera, audio, dialogue, and continuity.
- Use as a source for style coverage gaps in this skill.

Notes:
- Large curated Seedance 2.0 prompt collection with multilingual README and web gallery.
- README reports 3921 total prompts and last updated 2026-06-14.
- Licensed CC BY 4.0; preserve attribution if adapting examples.

### ZeroLu/awesome-seedance

URL: https://github.com/ZeroLu/awesome-seedance

Best use:
- Build a clearer taxonomy of prompt genres.
- Add category-specific templates for cinematic film, ads, social memes, UGC, animation, short drama, and VFX.
- Compare compact vs. timeline-heavy prompt formats.
- Study timestamped multi-shot examples for 10-15 second scenes with escalating action, sound cues, and final-frame holds.

Notes:
- Curated collection focused on high-fidelity prompts and techniques from community sources.
- Includes sections for cinematic styles, advertising, social media, UGC, anime/animation, short drama, and experimental effects.
- Licensed CC BY 4.0; use attribution for adapted material.

### EvoLinkAI/awesome-seedance-2-guide

URL: https://github.com/EvoLinkAI/awesome-seedance-2-guide

Best use:
- Improve multimodal reference handling.
- Add task-specific guidance for consistency, camera/action replication, creative effects, story completion, extension, audio/voice, one-continuous-shot, editing, music sync, and emotion performance.
- Cross-check file limits and prompt patterns before adding parameter guidance.

Notes:
- Practical Seedance 2.0 guide with use-case files under `use-cases/en/`.
- Useful `@material_name` patterns: map image, video, and audio assets to separate control roles.
- Treat platform/provider claims as time-sensitive and verify before presenting as current facts.
- Especially useful for capability taxonomy: consistency, camera/action replication, creative effects, story completion, video extension, audio/voice, one continuous shot, video editing, music sync, and emotion performance.

### gracech0322-cmd/seedance-2-prompt-library

URL: https://github.com/gracech0322-cmd/seedance-2-prompt-library

Best use:
- Extract the six-dimension prompt model: input, content, style, camera, structure, edit.
- Add simple starter templates for cinematic, anime, short series, commercial, viral, UGC, and VFX use cases.
- Improve moderation/safety-aware rewriting patterns.

Notes:
- README updated June 12, 2026.
- Contains platform access/pricing claims; verify current values before citing.
- Some real-face bypass discussion appears in the repo; do not add bypass instructions to this skill.

### heloraai/Seedance2.0-Prompt-Optimizer-skill

URL: https://github.com/heloraai/Seedance2.0-Prompt-Optimizer-skill

Best use:
- Compare skill architecture, not final wording.
- Consider adding a compact formula inspired by SCELA: subject, camera, effect, light, audio.
- Study how another skill separates templates, compliance, and vocabulary references.

Notes:
- Claims 18 templates across 8 genres and separate references for templates, compliance, and vocabulary.
- MIT licensed.
- Verify any claimed pass rates or restricted-word behavior before adopting.

### songguoxs/seedance-prompt-skill

URL: https://github.com/songguoxs/seedance-prompt-skill

Best use:
- Improve Chinese-language output modes.
- Add scenario coverage for ecommerce ads, short drama/dialogue, fantasy animation, science education, music videos, beat sync, video extension, and one-take long shots.
- Compare interactive clarification flow.

Notes:
- Single-file Claude Code style skill.
- Includes ten core prompt-generation capabilities and Chinese examples.
- MIT licensed.

### HitPaw-Official/awesome-ai-video-prompts

URL: https://github.com/HitPaw-Official/awesome-ai-video-prompts

Best use:
- Add lightweight cross-model AI video prompt formulas.
- Use as a compact reference for beginner-friendly prompt templates.

Notes:
- Contains Seedance and Veo prompt hubs plus general video prompt guides.
- More generic than Seedance-specific repositories, so use only for broad pattern checks.

## Papers And Platform References

### Seedance 2.0: Advancing Video Generation for World Complexity

URL: https://arxiv.org/abs/2604.14148

Best use:
- Cross-check high-level model capabilities: text, image, audio, and video as input modalities.
- Verify broad output assumptions such as 4-15 second generation and 480p/720p native output when platform-specific docs are unavailable.
- Understand why prompts should explicitly assign roles to reference images, videos, and audio.

Notes:
- Published as a model paper, not a product manual; do not treat every implementation detail as available in every consumer interface.
- The paper reports open platform reference limits such as up to 9 images, 3 videos, and 3 audio clips. Treat these as current-to-paper and verify before giving operational limits.

### Replicate Seedance 2.0 examples

URL: https://replicate.com/blog/how-to-make-remarkable-videos-with-seedance-2

Best use:
- Mine time-coded cinematic examples and high-motion physical scene language.
- Improve action, disaster, vehicle, fantasy, and environment prompts with concrete motion and sound cues.

Notes:
- Use as style and structure inspiration only; do not copy large prompt packs verbatim.
- Verify any API or pricing details directly with the provider before citing.

## Tooling And API Repositories

### EvoLinkAI/Seedance-2.0-Gateway-Service

URL: https://github.com/EvoLinkAI/Seedance-2.0-Gateway-Service

Best use:
- Consider only if the skill grows beyond prompt writing into API payload generation or integration notes.
- Compare parameter names, upload/reference flow, and request examples.

### gracech0322-cmd/promptlab-image-video-to-prompt

URL: https://github.com/gracech0322-cmd/promptlab-image-video-to-prompt

Best use:
- Consider as inspiration for a future workflow that turns images/videos into Seedance-ready prompt drafts.
- Useful if the skill later needs reverse prompt extraction from visual references.

## Remaining Improvement Ideas

Add these only when the user asks to expand the skill further:

1. A timeline builder for 10-15 second prompts with 3-5 beats.
2. A deeper consistency checklist for characters, products, logos, clothing, scene layout, and final frame.
3. A safety rewrite module that replaces unauthorized celebrity/IP prompts with original characters and style-adjacent descriptions.
4. A bilingual mode: write the operational prompt in Chinese by default, then add an English version only when requested.
5. A lightweight prompt scoring rubric for clarity, reference mapping, motion feasibility, continuity, and safety before final output.
