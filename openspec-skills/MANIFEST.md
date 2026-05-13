# OpenSpec Skills Manifest

## 目的

这份 `MANIFEST.md` 是 `out-skills/` 的双环境安装计划，用于指导将 7 个 `openspec-*` skills 与一个可独立替代整包的 `mini-openspec` 一起安装到 Trae 和 Claude 环境。

它回答：

- 每个 skill 是什么
- 每个 skill 应该复制到哪里
- Trae 和 Claude 分别如何挂载
- 是否需要命令入口
- 用户说什么时触发哪个 skill
- 安装后如何验证
- 如何回滚

## 包内容

```text
out-skills/
├── PLAN.md
├── MANIFEST.md
├── install-all.sh
├── mini-openspec/
│   └── SKILL.md
├── openspec-workflow-installer/
│   └── SKILL.md
├── openspec-change-planning/
│   └── SKILL.md
├── openspec-artifact-status/
│   └── SKILL.md
├── openspec-change-implementation/
│   └── SKILL.md
├── openspec-spec-sync/
│   └── SKILL.md
├── openspec-archive/
│   └── SKILL.md
└── openspec-tool-adapter/
    └── SKILL.md
```

## Skill 清单

| Skill | 主要职责 | 推荐触发 |
| --- | --- | --- |
| `mini-openspec` | 用单个 skill 压缩覆盖 OpenSpec 核心流程，适合低成本独立使用 | 想少装、少加载，但仍保留 OpenSpec 主流程 |
| `openspec-workflow-installer` | 初始化或更新 OpenSpec 工作流资产 | 安装、初始化、更新工作流 |
| `openspec-change-planning` | 创建 proposal/design/tasks/spec delta | 规划需求、创建 change |
| `openspec-artifact-status` | 判断 artifact 状态和下一步 | 检查状态、找阻塞点 |
| `openspec-change-implementation` | 按 tasks 和 specs 执行实现 | 开始实现、继续任务 |
| `openspec-spec-sync` | 合并 delta specs 到 main specs | 同步规范、更新主 spec |
| `openspec-archive` | 安全归档已完成 change | 归档、收尾 |
| `openspec-tool-adapter` | 生成宿主适配文件和挂载说明 | 适配 Trae、Claude 或自定义 agent |

## Trae 安装目标

Trae 推荐使用 `.trae/skills/<skill-name>/SKILL.md`。

目标结构：

```text
<target-project>/
└── .trae/
    └── skills/
        ├── mini-openspec/
        │   └── SKILL.md
        ├── openspec-workflow-installer/
        │   └── SKILL.md
        ├── openspec-change-planning/
        │   └── SKILL.md
        ├── openspec-artifact-status/
        │   └── SKILL.md
        ├── openspec-change-implementation/
        │   └── SKILL.md
        ├── openspec-spec-sync/
        │   └── SKILL.md
        ├── openspec-archive/
        │   └── SKILL.md
        └── openspec-tool-adapter/
            └── SKILL.md
```

### Trae 复制映射

| 源路径 | 目标路径 |
| --- | --- |
| `out-skills/mini-openspec/SKILL.md` | `.trae/skills/mini-openspec/SKILL.md` |
| `out-skills/openspec-workflow-installer/SKILL.md` | `.trae/skills/openspec-workflow-installer/SKILL.md` |
| `out-skills/openspec-change-planning/SKILL.md` | `.trae/skills/openspec-change-planning/SKILL.md` |
| `out-skills/openspec-artifact-status/SKILL.md` | `.trae/skills/openspec-artifact-status/SKILL.md` |
| `out-skills/openspec-change-implementation/SKILL.md` | `.trae/skills/openspec-change-implementation/SKILL.md` |
| `out-skills/openspec-spec-sync/SKILL.md` | `.trae/skills/openspec-spec-sync/SKILL.md` |
| `out-skills/openspec-archive/SKILL.md` | `.trae/skills/openspec-archive/SKILL.md` |
| `out-skills/openspec-tool-adapter/SKILL.md` | `.trae/skills/openspec-tool-adapter/SKILL.md` |

## Claude 安装目标

Claude 环境如果支持 agent skills，推荐与 Trae 保持类似结构：

```text
<target-project>/
└── .claude/
    └── skills/
        ├── mini-openspec/
        │   └── SKILL.md
        ├── openspec-workflow-installer/
        │   └── SKILL.md
        ├── openspec-change-planning/
        │   └── SKILL.md
        ├── openspec-artifact-status/
        │   └── SKILL.md
        ├── openspec-change-implementation/
        │   └── SKILL.md
        ├── openspec-spec-sync/
        │   └── SKILL.md
        ├── openspec-archive/
        │   └── SKILL.md
        └── openspec-tool-adapter/
            └── SKILL.md
```

如果目标 Claude 环境更偏 slash command 风格，则可以使用 `.claude/commands/openspec/` 生成命令 prompt 包装层，但这不是 7 个 skill 的必需安装项。

### Claude 复制映射

| 源路径 | 目标路径 |
| --- | --- |
| `out-skills/mini-openspec/SKILL.md` | `.claude/skills/mini-openspec/SKILL.md` |
| `out-skills/openspec-workflow-installer/SKILL.md` | `.claude/skills/openspec-workflow-installer/SKILL.md` |
| `out-skills/openspec-change-planning/SKILL.md` | `.claude/skills/openspec-change-planning/SKILL.md` |
| `out-skills/openspec-artifact-status/SKILL.md` | `.claude/skills/openspec-artifact-status/SKILL.md` |
| `out-skills/openspec-change-implementation/SKILL.md` | `.claude/skills/openspec-change-implementation/SKILL.md` |
| `out-skills/openspec-spec-sync/SKILL.md` | `.claude/skills/openspec-spec-sync/SKILL.md` |
| `out-skills/openspec-archive/SKILL.md` | `.claude/skills/openspec-archive/SKILL.md` |
| `out-skills/openspec-tool-adapter/SKILL.md` | `.claude/skills/openspec-tool-adapter/SKILL.md` |

## 推荐命令入口

如果宿主支持 command prompts，建议额外提供命令入口。

这些命令入口不替代 skill，只是更容易触发正确 skill。

| 命令名 | 对应 Skill | 典型触发 |
| --- | --- | --- |
| `openspec-mini` | `mini-openspec` | “用一个 skill 跑 OpenSpec”、“先低成本执行 OpenSpec” |
| `openspec-install` | `openspec-workflow-installer` | “初始化 OpenSpec”、“安装工作流” |
| `openspec-plan` | `openspec-change-planning` | “规划这个功能”、“创建 change” |
| `openspec-status` | `openspec-artifact-status` | “看当前状态”、“下一步做什么” |
| `openspec-apply` | `openspec-change-implementation` | “开始实现”、“做下一个任务” |
| `openspec-sync` | `openspec-spec-sync` | “同步 spec”、“合并规范” |
| `openspec-archive` | `openspec-archive` | “归档这个 change” |
| `openspec-adapt` | `openspec-tool-adapter` | “适配到 Trae/Claude”、“生成挂载示例” |

## Trae 命令建议

如果要为 Trae 同时安装命令入口，推荐目标目录：

```text
<target-project>/
└── .trae/
    └── commands/
        └── openspec/
            ├── mini.md
            ├── install.md
            ├── plan.md
            ├── status.md
            ├── apply.md
            ├── sync.md
            ├── archive.md
            └── adapt.md
```

Trae command prompt 可以是纯 Markdown，内容只需说明：

- 使用哪个 `openspec-*` skill
- 用户输入如何作为 change name 或 capability hint
- 输出格式要求

## Claude 命令建议

如果要为 Claude 同时安装命令入口，推荐目标目录：

```text
<target-project>/
└── .claude/
    └── commands/
        └── openspec/
            ├── mini.md
            ├── install.md
            ├── plan.md
            ├── status.md
            ├── apply.md
            ├── sync.md
            ├── archive.md
            └── adapt.md
```

Claude command prompt 建议使用 Markdown + YAML frontmatter，例如：

```markdown
---
name: OpenSpec Plan
description: Plan a new OpenSpec change.
category: Workflow
tags: [openspec, workflow, planning]
---

Use the `openspec-change-planning` skill.

User input:

```text
$ARGUMENTS
```
```

## 触发语句映射

### openspec-workflow-installer

- “初始化 OpenSpec”
- “安装 OpenSpec 工作流”
- “更新 OpenSpec 指令”
- “给这个项目装上 openspec skills”

### openspec-change-planning

- “先规划这个功能”
- “创建一个 change”
- “生成 proposal/design/tasks”
- “先不要写代码，先做方案”

### openspec-artifact-status

- “这个 change 现在什么状态”
- “下一步该做什么”
- “检查当前 OpenSpec 进度”
- “找一下阻塞点”

### openspec-change-implementation

- “开始实现这个 change”
- “继续做下一个 task”
- “按当前 tasks 实现”
- “根据 proposal 和 design 编码”

### openspec-spec-sync

- “同步 spec”
- “把 change spec 合并到主 spec”
- “更新正式规范”
- “把 delta specs 应用到 main specs”

### openspec-archive

- “归档这个 change”
- “这个变更完成了，收尾”
- “把 change 移到 archive”
- “完成 OpenSpec 归档流程”

### openspec-tool-adapter

- “适配到 Trae”
- “生成 Claude commands”
- “生成挂载示例”
- “把这套 workflow 移植到另一个 agent”

## 安装步骤

### 阶段 1：准备目标项目

确认目标项目路径：

```text
<target-project>
```

确认是否已有：

```text
<target-project>/.trae/
<target-project>/.claude/
<target-project>/.trae/skills/
<target-project>/.claude/skills/
```

如果目录不存在，安装时创建。

### 一键安装

推荐直接使用：

```bash
./out-skills/install-all.sh /path/to/target-project
```

这个脚本会一次性安装：

- 8 个 skill 到 `.trae/skills/`
- 8 个 skill 到 `.claude/skills/`
- Trae command prompts 到 `.trae/commands/openspec/`
- Claude command prompts 到 `.claude/commands/openspec/`

如果还要同时安装最小 `openspec/` 模板：

```bash
./out-skills/install-all.sh /path/to/target-project --with-openspec-template
```

安全规则：

- 默认不会创建或覆盖 `openspec/`
- 只有传入 `--with-openspec-template` 才尝试安装模板
- 如果目标项目已存在 `openspec/`，脚本会拒绝覆盖

### 阶段 2：安装 Trae skills

复制 8 个 skill 到：

```text
<target-project>/.trae/skills/
```

每个 skill 保留自己的目录名。

### 阶段 3：安装 Claude skills

复制 8 个 skill 到：

```text
<target-project>/.claude/skills/
```

每个 skill 保留自己的目录名。

### 阶段 4：可选安装 commands

如果需要快捷入口，为 Trae 和 Claude 分别生成：

```text
.trae/commands/openspec/*.md
.claude/commands/openspec/*.md
```

commands 只负责触发对应 skill，不承载完整规则。

### 阶段 5：初始化运行时目录

如果目标项目还没有 `openspec/`，可创建：

```text
openspec/
├── config.yaml
├── specs/
└── changes/
    └── archive/
```

如果目标项目已有 `openspec/`，不要覆盖。

## 验证清单

安装后检查：

- `.trae/skills/openspec-workflow-installer/SKILL.md` 存在
- `.trae/skills/mini-openspec/SKILL.md` 存在
- `.trae/skills/openspec-change-planning/SKILL.md` 存在
- `.trae/skills/openspec-artifact-status/SKILL.md` 存在
- `.trae/skills/openspec-change-implementation/SKILL.md` 存在
- `.trae/skills/openspec-spec-sync/SKILL.md` 存在
- `.trae/skills/openspec-archive/SKILL.md` 存在
- `.trae/skills/openspec-tool-adapter/SKILL.md` 存在
- `.claude/skills/openspec-workflow-installer/SKILL.md` 存在
- `.claude/skills/mini-openspec/SKILL.md` 存在
- `.claude/skills/openspec-change-planning/SKILL.md` 存在
- `.claude/skills/openspec-artifact-status/SKILL.md` 存在
- `.claude/skills/openspec-change-implementation/SKILL.md` 存在
- `.claude/skills/openspec-spec-sync/SKILL.md` 存在
- `.claude/skills/openspec-archive/SKILL.md` 存在
- `.claude/skills/openspec-tool-adapter/SKILL.md` 存在

如果安装了 commands，也检查：

- `.trae/commands/openspec/mini.md`
- `.trae/commands/openspec/install.md`
- `.trae/commands/openspec/plan.md`
- `.trae/commands/openspec/status.md`
- `.trae/commands/openspec/apply.md`
- `.trae/commands/openspec/sync.md`
- `.trae/commands/openspec/archive.md`
- `.trae/commands/openspec/adapt.md`
- `.claude/commands/openspec/mini.md`
- `.claude/commands/openspec/install.md`
- `.claude/commands/openspec/plan.md`
- `.claude/commands/openspec/status.md`
- `.claude/commands/openspec/apply.md`
- `.claude/commands/openspec/sync.md`
- `.claude/commands/openspec/archive.md`
- `.claude/commands/openspec/adapt.md`

## 功能验证流程

推荐用一个测试 change 验证：

1. 触发 `openspec-workflow-installer`
2. 触发 `openspec-change-planning`
3. 创建一个测试 change，例如 `add-sample-feature`
4. 触发 `openspec-artifact-status`
5. 确认状态变成 `planning` 或 `ready-for-implementation`
6. 触发 `openspec-change-implementation`
7. 完成一个任务并检查 `tasks.md`
8. 触发 `openspec-spec-sync`
9. 检查 `openspec/specs/`
10. 触发 `openspec-archive`
11. 检查 archive 目录

## 回滚计划

如果需要回滚 Trae 安装，删除：

```text
<target-project>/.trae/skills/openspec-workflow-installer/
<target-project>/.trae/skills/openspec-change-planning/
<target-project>/.trae/skills/openspec-artifact-status/
<target-project>/.trae/skills/openspec-change-implementation/
<target-project>/.trae/skills/openspec-spec-sync/
<target-project>/.trae/skills/openspec-archive/
<target-project>/.trae/skills/openspec-tool-adapter/
<target-project>/.trae/commands/openspec/
```

如果需要回滚 Claude 安装，删除：

```text
<target-project>/.claude/skills/openspec-workflow-installer/
<target-project>/.claude/skills/openspec-change-planning/
<target-project>/.claude/skills/openspec-artifact-status/
<target-project>/.claude/skills/openspec-change-implementation/
<target-project>/.claude/skills/openspec-spec-sync/
<target-project>/.claude/skills/openspec-archive/
<target-project>/.claude/skills/openspec-tool-adapter/
<target-project>/.claude/commands/openspec/
```

默认不要删除：

```text
openspec/
```

因为它可能包含真实项目规范和变更历史。

## 推荐最小安装

如果只想先用最低成本方式体验，优先安装：

- `mini-openspec`

如果想先试用细分技能，安装：

- `openspec-change-planning`
- `openspec-artifact-status`
- `openspec-change-implementation`
- `openspec-spec-sync`
- `openspec-archive`

如果要完整替代 OpenSpec，安装全部 7 个：

- `openspec-workflow-installer`
- `openspec-change-planning`
- `openspec-artifact-status`
- `openspec-change-implementation`
- `openspec-spec-sync`
- `openspec-archive`
- `openspec-tool-adapter`

## 后续可自动化

当前已生成：

- `install-all.sh`

后续如需更细粒度安装，可以继续拆分：

- `install-to-trae.sh`
- `install-to-claude.sh`
- `commands/trae/*.md`
- `commands/claude/*.md`