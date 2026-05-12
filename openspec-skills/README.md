# OpenSpec Skills

`openspec-skills` 是一组可移植的 Agent Skills，用来把 OpenSpec 的核心工作流拆成 7 个独立能力，并支持一键安装到 Trae 和 Claude 双环境。

这套 skills 的目标是：在不依赖 OpenSpec CLI 的情况下，让通用 agent 也能按 OpenSpec 风格完成规划、状态判断、实现、规范同步和归档。

## 包含内容

```text
openspec-skills/
├── README.md
├── PLAN.md
├── MANIFEST.md
├── install-all.sh
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

## 7 个 Skill

| Skill | 作用 | 什么时候用 |
| --- | --- | --- |
| `openspec-workflow-installer` | 初始化或更新 OpenSpec 工作流资产 | 安装、初始化、更新工作流 |
| `openspec-change-planning` | 创建 proposal、design、tasks 和 delta specs | 开发前规划需求 |
| `openspec-artifact-status` | 判断 change 状态、artifact 状态和下一步 | 检查进度或阻塞点 |
| `openspec-change-implementation` | 按 proposal/design/tasks/specs 执行实现 | 开始或继续编码 |
| `openspec-spec-sync` | 把 change delta specs 合并到 main specs | 同步正式规范 |
| `openspec-archive` | 安全归档已完成 change | 完成变更收尾 |
| `openspec-tool-adapter` | 生成宿主适配文件和挂载说明 | 适配 Trae、Claude 或其他 agent |

## 快速安装

在仓库根目录执行：

```bash
./openspec-skills/install-all.sh /path/to/target-project
```

这会安装：

- 7 个 skill 到目标项目 `.trae/skills/`
- 7 个 skill 到目标项目 `.claude/skills/`
- Trae command prompts 到 `.trae/commands/openspec/`
- Claude command prompts 到 `.claude/commands/openspec/`

如果还想同时安装最小 `openspec/` 模板：

```bash
./openspec-skills/install-all.sh /path/to/target-project --with-openspec-template
```

安全规则：

- 默认不会创建或覆盖目标项目的 `openspec/`
- 只有加 `--with-openspec-template` 才会安装模板
- 如果目标项目已有 `openspec/`，脚本会拒绝覆盖

## 安装后的目录

Trae：

```text
<target-project>/
└── .trae/
    ├── skills/
    │   └── openspec-*/
    │       └── SKILL.md
    └── commands/
        └── openspec/
            ├── install.md
            ├── plan.md
            ├── status.md
            ├── apply.md
            ├── sync.md
            ├── archive.md
            └── adapt.md
```

Claude：

```text
<target-project>/
└── .claude/
    ├── skills/
    │   └── openspec-*/
    │       └── SKILL.md
    └── commands/
        └── openspec/
            ├── install.md
            ├── plan.md
            ├── status.md
            ├── apply.md
            ├── sync.md
            ├── archive.md
            └── adapt.md
```

## 推荐触发语句

| 用户说法 | 推荐 Skill |
| --- | --- |
| “初始化 OpenSpec” | `openspec-workflow-installer` |
| “先规划这个功能” | `openspec-change-planning` |
| “这个 change 现在什么状态” | `openspec-artifact-status` |
| “按 tasks 开始实现” | `openspec-change-implementation` |
| “同步 spec” | `openspec-spec-sync` |
| “归档这个 change” | `openspec-archive` |
| “适配到 Trae/Claude” | `openspec-tool-adapter` |

## 推荐命令入口

如果宿主支持 command prompts，安装脚本会生成以下入口：

| Command | 对应 Skill |
| --- | --- |
| `openspec:install` | `openspec-workflow-installer` |
| `openspec:plan` | `openspec-change-planning` |
| `openspec:status` | `openspec-artifact-status` |
| `openspec:apply` | `openspec-change-implementation` |
| `openspec:sync` | `openspec-spec-sync` |
| `openspec:archive` | `openspec-archive` |
| `openspec:adapt` | `openspec-tool-adapter` |

## 典型流程

```text
1. openspec-workflow-installer
   初始化或更新目标项目工作流

2. openspec-change-planning
   创建 proposal/design/tasks/spec delta

3. openspec-artifact-status
   检查 change 是否 ready

4. openspec-change-implementation
   按 tasks 实现代码

5. openspec-spec-sync
   把 change spec 同步到 main spec

6. openspec-archive
   归档已完成 change
```

## 文档说明

- `PLAN.md`: 7 个 skill 的拆分计划、职责边界和实施顺序
- `MANIFEST.md`: Trae 和 Claude 双环境安装计划、挂载路径、触发语句、验证和回滚说明
- `install-all.sh`: 一键安装脚本

## 验证安装

安装后检查这些文件是否存在：

```text
<target-project>/.trae/skills/openspec-change-planning/SKILL.md
<target-project>/.claude/skills/openspec-change-planning/SKILL.md
<target-project>/.trae/commands/openspec/plan.md
<target-project>/.claude/commands/openspec/plan.md
```

然后尝试让 agent 执行：

```text
先按 OpenSpec 规划一个 add-sample-feature change
```

预期会触发 `openspec-change-planning`，并创建或建议创建 OpenSpec change 规划文件。

## 回滚

如果需要移除安装结果，删除目标项目中的：

```text
.trae/skills/openspec-*/
.trae/commands/openspec/
.claude/skills/openspec-*/
.claude/commands/openspec/
```

默认不要删除：

```text
openspec/
```

因为它可能包含真实项目规范和变更历史。

## 适用场景

- 想把 OpenSpec 能力移植到通用 agent
- 想同时支持 Trae 和 Claude
- 想用 skill 而不是 CLI 管理 spec-driven workflow
- 想让 agent 在实现前先规划，在实现后同步规范并归档

## Attribution

This skill package is derived from and inspired by the OpenSpec project. It extracts OpenSpec's core spec-driven workflow concepts into portable agent skills for Trae, Claude, and other coding agents.

The original OpenSpec project provides a full CLI, schema runtime, artifact graph, workflow templates, multi-tool adapters, validation, and spec synchronization features. This package focuses only on the portable agent-skill abstraction layer.

All credit for the original workflow concepts and implementation patterns belongs to the OpenSpec project and its contributors.

## 来源与致意

这组 skills 是基于 OpenSpec 项目的核心工作流能力抽象而来，用于探索如何将 OpenSpec 的 spec-driven development 思想移植为通用 agent skills。

OpenSpec 原项目提供了完整的 CLI、schema、artifact graph、workflow templates、多工具适配和规范同步能力；本目录只保留其中可移植到通用 agent 的 skill 层抽象。

感谢 OpenSpec 项目对 AI-native spec-driven development 工作流的设计和实现启发。
