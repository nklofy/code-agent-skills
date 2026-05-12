# Out-Skills

This directory contains a compact, portable skill suite distilled from the
broader `gstack` project.

The goal is not to reproduce the entire `gstack` runtime. The goal is to keep
the most reusable workflow logic in a form that can be moved into a general
agent environment.

## Included Skills

### `gstack-office-hours`

- Reframes a request into the real problem, user pain, and product direction
- Use when the request is still fuzzy or the user may be solving the wrong problem

### `gstack-task-planner`

- Turns a request into a bounded implementation plan
- Use when the task needs decomposition before coding

### `gstack-engineering-workflow`

- Runs a general delivery flow from clarification to verified implementation
- Use when the user wants the task executed end to end

### `gstack-task-reviewer`

- Reviews code changes for bugs, regressions, and missing verification
- Use when the user asks for review or a pre-merge check

### `gstack-bug-investigator`

- Investigates failures through reproduction, hypotheses, and root-cause analysis
- Use when behavior is broken and the cause is unclear

## Recommended Routing

- Choose `gstack-office-hours` for problem framing
- Choose `gstack-task-planner` for plan creation
- Choose `gstack-engineering-workflow` for implementation
- Choose `gstack-task-reviewer` for review
- Choose `gstack-bug-investigator` for debugging

## Typical Flows

### Product Discovery To Build

1. `gstack-office-hours`
2. `gstack-task-planner`
3. `gstack-engineering-workflow`

### Debug Then Fix

1. `gstack-bug-investigator`
2. `gstack-engineering-workflow`

### Build Then Review

1. `gstack-engineering-workflow`
2. `gstack-task-reviewer`

## Portability Principles

These skills intentionally avoid:

- Host-specific slash command assumptions
- Browser-daemon dependencies
- Telemetry or memory dependencies
- Project-specific shell preambles

They should still work in hosts with different tool surfaces, as long as the
agent can adapt file reads, edits, diagnostics, and verification to the tools
available.

## Structure

Each skill lives in its own directory and contains a single `SKILL.md`.

## Attribution

This skill suite is informed by and distilled from the workflow design and
methodology developed in [gstack](https://github.com/garrytan/gstack).

It is not intended to be a full reproduction of the original project.
Instead, this repository extracts a smaller set of portable, host-agnostic
skills derived from gstack's broader approach to product framing, planning,
implementation, review, and debugging.

We gratefully acknowledge the original project for the ideas and engineering
workflow patterns that inspired this adaptation.

### 来源与致意

本套 skill 受到 [gstack](https://github.com/garrytan/gstack) 的工作流设计与
方法论启发，并在此基础上进行了提炼与通用化整理。

本仓库并非对原项目的完整复刻，而是从其更完整的方法体系中抽取出一组更小、
更可移植、宿主无关的技能，用于覆盖产品定义、任务规划、工程实现、代码审查
与问题排查等核心流程。

在此对原项目提供的方法论思路与工程实践启发致以感谢。
