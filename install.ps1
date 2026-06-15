param(
    [ValidateSet("codex", "claude")]
    [string]$Target = $(if ($env:SEEDANCE_SKILL_TARGET) { $env:SEEDANCE_SKILL_TARGET } else { "codex" }),

    [ValidateSet("global", "project")]
    [string]$Scope = $(if ($env:SEEDANCE_SKILL_SCOPE) { $env:SEEDANCE_SKILL_SCOPE } else { "global" })
)

$ErrorActionPreference = "Stop"

$rawBase = "https://raw.githubusercontent.com/luofeiawyjwj/seedance-prompt-writer/main"
$skillName = "seedance-prompt-writer"

if ($Target -eq "claude") {
    $root = if ($Scope -eq "project") { ".claude\skills" } else { Join-Path $env:USERPROFILE ".claude\skills" }
} else {
    $root = if ($Scope -eq "project") { ".agents\skills" } else { Join-Path $env:USERPROFILE ".agents\skills" }
}

$dst = Join-Path $root $skillName

Remove-Item -LiteralPath $dst -Recurse -Force -ErrorAction SilentlyContinue
New-Item -ItemType Directory -Force (Join-Path $dst "agents") | Out-Null
New-Item -ItemType Directory -Force (Join-Path $dst "references") | Out-Null

Invoke-WebRequest -UseBasicParsing "$rawBase/SKILL.md" -OutFile (Join-Path $dst "SKILL.md")
Invoke-WebRequest -UseBasicParsing "$rawBase/agents/openai.yaml" -OutFile (Join-Path $dst "agents\openai.yaml")
Invoke-WebRequest -UseBasicParsing "$rawBase/references/prompt-patterns.md" -OutFile (Join-Path $dst "references\prompt-patterns.md")
Invoke-WebRequest -UseBasicParsing "$rawBase/references/github-resources.md" -OutFile (Join-Path $dst "references\github-resources.md")

Write-Host "Installed $skillName for $Target ($Scope): $dst"
