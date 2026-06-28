# code-agent-skills

[中文](#中文) | [English](#english)

## 中文

`code-agent-skills` 是一个面向通用 Coding Agent 的可移植 skill 集合仓库。

它当前整理了 7 套不同来源和风格的 skills，目标是把原本依赖特定宿主、特定工作流或特定项目背景的方法，提炼成可以单独分发、单独安装、单独复用的 skill 包。

### 仓库内容

| 目录 | 定位 | 适合场景 |
| --- | --- | --- |
| `openspec-skills/` | OpenSpec 风格的 spec-driven workflow skills，含可独立替代整包的 `mini-openspec` | 先规划 proposal/design/tasks/spec，再实现、同步、归档 |
| `superpowers-skills/` | Superpowers 的扁平化前缀版技能集，含可独立替代整包的 `mini-superpowers` | 复杂开发、调试、代码审查、计划执行、技能编写 |
| `gstack-skills/` | 从 gstack 提炼出的轻量工程工作流 skills，含可独立替代整包的 `mini-gstack` | 问题澄清、任务规划、实现、评审、排障 |
| `mattpocock-skills/` | 从 `mattpocock/skills` 蒸馏的产品交付与代码设计 skills | 想法澄清、PRD、issue 拆分、TDD、架构改进 |
| `anthropics-official/` | 从 `anthropics/skills` 蒸馏的 Anthropic 官方通用 skills | 文档、表格、演示、网页构建、Claude API、MCP、测试与设计 |
| `affaan-m-ECC/` | 从 `affaan-m/ECC` 蒸馏的大规模工程与领域 skills | 多语言工程实践、测试、安全、运维、产品、研究与自动化 |
| `xstongxue-best-skills/` | 从 `xstongxue/best-skills` 蒸馏的中文内容与图表 skills | 技术文档、论文、专利、图表、PPT、微信文章与前端设计 |

### 目录结构

```text
code-agent-skills/
├── README.md
├── LICENSE
├── openspec-skills/
│   ├── README.md
│   ├── MANIFEST.md
│   ├── PLAN.md
│   ├── install-all.sh
│   ├── mini-openspec/
│   └── openspec-*/
├── superpowers-skills/
│   ├── README.md
│   ├── MANIFEST.md
│   ├── install-all.sh
│   ├── mini-superpowers/
│   └── superpowers-*/
├── gstack-skills/
│   ├── README.md
│   ├── MANIFEST.md
│   ├── PLAN.md
│   ├── install-all.sh
│   ├── mini-gstack/
│   └── gstack-*/
├── mattpocock-skills/
│   ├── README.md
│   ├── CHECKLIST.md
│   └── mattpocock-*/
├── anthropics-official/
│   └── */
├── affaan-m-ECC/
│   └── */
└── xstongxue-best-skills/
    └── */
```

### 快速开始

#### OpenSpec

安装到目标项目：

```bash
./openspec-skills/install-all.sh /path/to/target-project
```

可选安装最小 `openspec/` 模板：

```bash
./openspec-skills/install-all.sh /path/to/target-project --with-openspec-template
```

更多说明见 [openspec-skills/README.md](./openspec-skills/README.md)。

低成本使用时，直接用 `mini-openspec` 即可；需要更细粒度控制时再切到具体 `openspec-*` skill。

如果只想保留最低成本能力，通常只安装 `mini-openspec/` 也足够。

#### Superpowers

安装到目标项目：

```bash
./superpowers-skills/install-all.sh /path/to/target-project
```

默认会安装：

- `superpowers-*` skills 到目标项目 `.trae/skills/` 和 `.claude/skills/`
- `superpowers:*` command prompts 到目标项目 `.trae/commands/superpowers/` 和 `.claude/commands/superpowers/`

更多说明见 [superpowers-skills/README.md](./superpowers-skills/README.md)。

低成本使用时，直接用 `mini-superpowers` 即可；需要更强约束或更细分流程时再进入 `superpowers-*` workflow。

如果只想保留最低成本能力，通常只安装 `mini-superpowers/` 也足够。

#### gstack

从仓库内安装当前这套轻量 skills：

```bash
./gstack-skills/install-all.sh
```

如需拷贝而不是软链接：

```bash
./gstack-skills/install-all.sh --copy
```

更多说明见 [gstack-skills/README.md](./gstack-skills/README.md)。

低成本使用时，直接用 `mini-gstack` 即可；需要更专业的单阶段工作流时再选择 `gstack-*` 细分 skill。

如果只想保留最低成本能力，通常只安装 `mini-gstack/` 也足够。

#### 其他蒸馏来源包

`mattpocock-skills/`、`anthropics-official/`、`affaan-m-ECC/` 和 `xstongxue-best-skills/` 是从各自原始仓库蒸馏得到的目录化 skill 集合。它们当前主要以独立 `SKILL.md` 目录形式组织；使用时可以直接指向具体 skill 目录，或按需复制到目标项目的 agent skills 目录。

### 推荐选型

- 如果你需要严格的规范驱动开发流程，选 `openspec-skills`
- 如果你需要完整的开发过程增强能力，选 `superpowers-skills`
- 如果你需要更轻量、更通用的工程执行工作流，选 `gstack-skills`
- 如果你需要从 idea 到 PRD、issue、TDD 和架构改进的产品交付闭环，选 `mattpocock-skills`
- 如果你需要覆盖文档、办公文件、API、MCP、前端设计等通用能力，选 `anthropics-official`
- 如果你需要大量工程语言、领域流程和 agent 运维类技能，选 `affaan-m-ECC`
- 如果你需要中文内容、图表、论文、专利、PPT 和公众号写作能力，选 `xstongxue-best-skills`

### 常见安装位置

大多数 skill 包会把内容安装到类似目录：

```text
<target-project>/.trae/skills/
<target-project>/.claude/skills/
<target-project>/.trae/commands/
<target-project>/.claude/commands/
```

具体是否生成 commands、是否支持模板安装、是否使用复制或软链接，以各子目录中的 `README.md`、`MANIFEST.md`、`install-all.sh` 或单个 `SKILL.md` 为准。

### 设计原则

- 可移植：尽量降低对特定宿主、CLI、守护进程和项目结构的绑定
- 可组合：把大型工作流拆成独立技能，便于按场景组合调用
- 可安装：尽量提供一键安装脚本，减少手工复制目录的成本
- 可审阅：保留 `README.md`、`MANIFEST.md`、`PLAN.md` 等说明文件，方便理解技能边界和来源

### 版权与来源

本仓库中的不同 skills 套件分别受到各自上游项目启发或基于其内容整理而来。其中以下目录是从原始仓库蒸馏得到的 skills：

| 目录 | 原始仓库 |
| --- | --- |
| `mattpocock-skills/` | <https://github.com/mattpocock/skills> |
| `anthropics-official/` | <https://github.com/anthropics/skills> |
| `affaan-m-ECC/` | <https://github.com/affaan-m/ECC> |
| `xstongxue-best-skills/` | <https://github.com/xstongxue/best-skills> |

使用或再分发时，请同时检查对应上游仓库和本仓库子目录内保留的许可文件、说明文件与致谢信息。

## English

`code-agent-skills` is a repository of portable skill packages for general-purpose coding agents.

It currently brings together 7 skill suites from different origins and workflow styles. The goal is to extract reusable methods that would otherwise depend on a specific host, workflow, or project context, and package them so they can be distributed, installed, and reused independently.

### Packages

| Directory | Positioning | Best For |
| --- | --- | --- |
| `openspec-skills/` | OpenSpec-style spec-driven workflow skills with `mini-openspec` as a standalone low-cost replacement | Planning proposals, design, tasks, and specs before implementation, sync, and archive |
| `superpowers-skills/` | Flat, prefixed adaptation of Superpowers skills with `mini-superpowers` as a standalone low-cost replacement | Complex development work, debugging, code review, plan execution, and skill authoring |
| `gstack-skills/` | Lightweight engineering workflow skills distilled from gstack with `mini-gstack` as a standalone low-cost replacement | Problem framing, task planning, implementation, review, and debugging |
| `mattpocock-skills/` | Product delivery and code design skills distilled from `mattpocock/skills` | Idea clarification, PRDs, issue slicing, TDD, and architecture improvement |
| `anthropics-official/` | Anthropic official general-purpose skills distilled from `anthropics/skills` | Documents, spreadsheets, slides, web artifacts, Claude API, MCP, testing, and design |
| `affaan-m-ECC/` | Large engineering and domain skill collection distilled from `affaan-m/ECC` | Multi-language engineering, testing, security, operations, product, research, and automation |
| `xstongxue-best-skills/` | Chinese content and diagram skills distilled from `xstongxue/best-skills` | Technical docs, papers, patents, diagrams, PPTs, WeChat articles, and frontend design |

### Structure

```text
code-agent-skills/
├── README.md
├── LICENSE
├── openspec-skills/
│   ├── README.md
│   ├── MANIFEST.md
│   ├── PLAN.md
│   ├── install-all.sh
│   ├── mini-openspec/
│   └── openspec-*/
├── superpowers-skills/
│   ├── README.md
│   ├── MANIFEST.md
│   ├── install-all.sh
│   ├── mini-superpowers/
│   └── superpowers-*/
├── gstack-skills/
│   ├── README.md
│   ├── MANIFEST.md
│   ├── PLAN.md
│   ├── install-all.sh
│   ├── mini-gstack/
│   └── gstack-*/
├── mattpocock-skills/
│   ├── README.md
│   ├── CHECKLIST.md
│   └── mattpocock-*/
├── anthropics-official/
│   └── */
├── affaan-m-ECC/
│   └── */
└── xstongxue-best-skills/
    └── */
```

### Quick Start

#### OpenSpec

Install into a target project:

```bash
./openspec-skills/install-all.sh /path/to/target-project
```

Optionally install a minimal `openspec/` template:

```bash
./openspec-skills/install-all.sh /path/to/target-project --with-openspec-template
```

See [openspec-skills/README.md](./openspec-skills/README.md) for details.

Recommended low-cost starting point: `mini-openspec`

If you only want the smallest install footprint, installing just `mini-openspec/` is often enough.

#### Superpowers

Install into a target project:

```bash
./superpowers-skills/install-all.sh /path/to/target-project
```

By default this installs:

- `superpowers-*` skills into the target project's `.trae/skills/` and `.claude/skills/`
- `superpowers:*` command prompts into the target project's `.trae/commands/superpowers/` and `.claude/commands/superpowers/`

See [superpowers-skills/README.md](./superpowers-skills/README.md) for details.

Recommended low-cost starting point: `mini-superpowers`

If you only want the smallest install footprint, installing just `mini-superpowers/` is often enough.

#### gstack

Install the lightweight skill suite from this repository:

```bash
./gstack-skills/install-all.sh
```

To copy files instead of using symlinks:

```bash
./gstack-skills/install-all.sh --copy
```

See [gstack-skills/README.md](./gstack-skills/README.md) for details.

Recommended low-cost starting point: `mini-gstack`

If you only want the smallest install footprint, installing just `mini-gstack/` is often enough.

#### Other Distilled Source Packages

`mattpocock-skills/`, `anthropics-official/`, `affaan-m-ECC/`, and `xstongxue-best-skills/` are directory-based skill collections distilled from their original repositories. They are currently organized mainly as standalone `SKILL.md` directories; use them by pointing an agent at a specific skill directory or by copying selected skills into the target project's agent skills directory.

### Recommended Choice

- Choose `openspec-skills` if you want a strict spec-driven development workflow
- Choose `superpowers-skills` if you want a broader development-process enhancement toolkit
- Choose `gstack-skills` if you want a lighter and more general engineering workflow
- Choose `mattpocock-skills` if you want a product delivery loop from idea to PRD, issues, TDD, and architecture improvement
- Choose `anthropics-official` if you want general capabilities across documents, office files, APIs, MCP, frontend design, and testing
- Choose `affaan-m-ECC` if you want a large set of engineering-language, domain, and agent-operations skills
- Choose `xstongxue-best-skills` if you want Chinese content, diagrams, papers, patents, PPTs, and WeChat writing skills

### Common Install Locations

Most skill packages install into directories like:

```text
<target-project>/.trae/skills/
<target-project>/.claude/skills/
<target-project>/.trae/commands/
<target-project>/.claude/commands/
```

Whether commands are generated, templates are supported, or copy vs symlink is used depends on each package's own `README.md`, `MANIFEST.md`, `install-all.sh`, or individual `SKILL.md` files.

### Design Principles

- Portable: minimize coupling to a specific host, CLI, daemon, or project layout
- Composable: split large workflows into smaller skills that can be combined by scenario
- Installable: provide one-command installers where possible to reduce manual setup
- Reviewable: keep `README.md`, `MANIFEST.md`, and `PLAN.md` so the package boundary and intent stay understandable

### Licensing and Attribution

Each skill suite in this repository is inspired by or derived from its own upstream project. The following directories are distilled from their original repositories:

| Directory | Original Repository |
| --- | --- |
| `mattpocock-skills/` | <https://github.com/mattpocock/skills> |
| `anthropics-official/` | <https://github.com/anthropics/skills> |
| `affaan-m-ECC/` | <https://github.com/affaan-m/ECC> |
| `xstongxue-best-skills/` | <https://github.com/xstongxue/best-skills> |

Before using or redistributing these skills, check the corresponding upstream repositories and the license, documentation, and attribution files retained in each package directory.
