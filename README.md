# code-agent-skills

[中文](#中文) | [English](#english)

## 中文

`code-agent-skills` 是一个面向通用 Coding Agent 的可移植 skill 集合仓库。

它当前整理了 3 套不同来源和风格的 skills，目标是把原本依赖特定宿主、特定工作流或特定项目背景的方法，提炼成可以单独分发、单独安装、单独复用的 skill 包。

### 仓库内容

| 目录 | 定位 | 适合场景 |
| --- | --- | --- |
| `openspec-skills/` | OpenSpec 风格的 spec-driven workflow skills，含可独立替代整包的 `mini-openspec` | 先规划 proposal/design/tasks/spec，再实现、同步、归档 |
| `superpowers-skills/` | Superpowers 的扁平化前缀版技能集，含可独立替代整包的 `mini-superpowers` | 复杂开发、调试、代码审查、计划执行、技能编写 |
| `gstack-skills/` | 从 gstack 提炼出的轻量工程工作流 skills，含可独立替代整包的 `mini-gstack` | 问题澄清、任务规划、实现、评审、排障 |

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
└── gstack-skills/
    ├── README.md
    ├── MANIFEST.md
    ├── PLAN.md
    ├── install-all.sh
    ├── mini-gstack/
    └── gstack-*/
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

### 推荐选型

- 如果你需要严格的规范驱动开发流程，选 `openspec-skills`
- 如果你需要完整的开发过程增强能力，选 `superpowers-skills`
- 如果你需要更轻量、更通用的工程执行工作流，选 `gstack-skills`

### 常见安装位置

大多数 skill 包会把内容安装到类似目录：

```text
<target-project>/.trae/skills/
<target-project>/.claude/skills/
<target-project>/.trae/commands/
<target-project>/.claude/commands/
```

具体是否生成 commands、是否支持模板安装、是否使用复制或软链接，以各子目录中的 `README.md` 和 `install-all.sh` 为准。

### 设计原则

- 可移植：尽量降低对特定宿主、CLI、守护进程和项目结构的绑定
- 可组合：把大型工作流拆成独立技能，便于按场景组合调用
- 可安装：尽量提供一键安装脚本，减少手工复制目录的成本
- 可审阅：保留 `README.md`、`MANIFEST.md`、`PLAN.md` 等说明文件，方便理解技能边界和来源

### 版权与来源

本仓库中的不同 skills 套件分别受到各自上游项目启发或基于其内容整理而来，具体来源、许可与致谢请查看各子目录中的 `README.md`。

## English

`code-agent-skills` is a repository of portable skill packages for general-purpose coding agents.

It currently brings together 3 skill suites from different origins and workflow styles. The goal is to extract reusable methods that would otherwise depend on a specific host, workflow, or project context, and package them so they can be distributed, installed, and reused independently.

### Packages

| Directory | Positioning | Best For |
| --- | --- | --- |
| `openspec-skills/` | OpenSpec-style spec-driven workflow skills with `mini-openspec` as a standalone low-cost replacement | Planning proposals, design, tasks, and specs before implementation, sync, and archive |
| `superpowers-skills/` | Flat, prefixed adaptation of Superpowers skills with `mini-superpowers` as a standalone low-cost replacement | Complex development work, debugging, code review, plan execution, and skill authoring |
| `gstack-skills/` | Lightweight engineering workflow skills distilled from gstack with `mini-gstack` as a standalone low-cost replacement | Problem framing, task planning, implementation, review, and debugging |

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
└── gstack-skills/
    ├── README.md
    ├── MANIFEST.md
    ├── PLAN.md
    ├── install-all.sh
    ├── mini-gstack/
    └── gstack-*/
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

### Recommended Choice

- Choose `openspec-skills` if you want a strict spec-driven development workflow
- Choose `superpowers-skills` if you want a broader development-process enhancement toolkit
- Choose `gstack-skills` if you want a lighter and more general engineering workflow

### Common Install Locations

Most skill packages install into directories like:

```text
<target-project>/.trae/skills/
<target-project>/.claude/skills/
<target-project>/.trae/commands/
<target-project>/.claude/commands/
```

Whether commands are generated, templates are supported, or copy vs symlink is used depends on each package's own `README.md` and `install-all.sh`.

### Design Principles

- Portable: minimize coupling to a specific host, CLI, daemon, or project layout
- Composable: split large workflows into smaller skills that can be combined by scenario
- Installable: provide one-command installers where possible to reduce manual setup
- Reviewable: keep `README.md`, `MANIFEST.md`, and `PLAN.md` so the package boundary and intent stay understandable

### Licensing and Attribution

Each skill suite in this repository is inspired by or derived from its own upstream project. See the corresponding package `README.md` for source, licensing, and attribution details.