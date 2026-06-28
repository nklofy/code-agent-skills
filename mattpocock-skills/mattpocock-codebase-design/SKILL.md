# Mattpocock Codebase Design

Use one shared architecture language across planning, Mattpocock TDD, and architecture review. The purpose is to create modules with high leverage: callers learn a small interface and get substantial behavior behind it.

## When To Use

Use when choosing seams, improving testability, comparing module interfaces, or reviewing architecture with the core workflow skills.

## Vocabulary

Use these terms consistently:

- **Module**: anything with an interface and an implementation: function, class, package, workflow, or cross-layer slice.
- **Interface**: everything a caller must know to use a module correctly: calls, invariants, ordering, error modes, configuration, and performance expectations.
- **Implementation**: the behavior hidden behind the interface.
- **Depth**: how much useful behavior sits behind the interface. A deep module gives high capability for low caller burden.
- **Shallow module**: interface complexity nearly matches implementation complexity.
- **Seam**: the place where behavior can vary without editing the caller.
- **Adapter**: a concrete implementation used at a seam.
- **Leverage**: the payoff callers get when one interface hides repeated complexity.
- **Locality**: the payoff maintainers get when changes and bugs concentrate in one place.

Avoid drifting to overloaded substitutes. Prefer `module` over component/service/unit, `interface` over API/signature, and `seam` over boundary.

## Principles

- **The interface is the test surface.** Tests should cross the same seam callers cross.
- **Delete-test shallow modules.** If deleting a module only moves its thin logic elsewhere, it was not earning its interface.
- **One adapter is a guess; two adapters make a seam real.** Introduce a seam when behavior genuinely varies.
- **Depth is not line count.** A module is deep when its interface produces leverage, not when its implementation is long.
- **Internal seams can exist.** A module may use private internal seams for its own implementation; do not expose them just because tests need setup.

## Deepening A Cluster

When reviewing a cluster of shallow modules, classify dependencies before proposing a new seam:

- **In-process**: pure computation or in-memory state. Usually deepen directly and test through the new interface.
- **Local-substitutable**: database, filesystem, or runtime dependency with a local stand-in. Test the deepened module with the local stand-in.
- **Remote but owned**: internal service over HTTP, queue, or RPC. Define a port at the seam; use production and in-memory adapters.
- **True external**: third-party services. Inject a port and test with a mock adapter.

Prefer replacement over layering. Once a deep interface has good tests, delete obsolete tests that only covered old shallow modules.

## Interface Design Checklist

Before proposing an interface, answer:

- What behavior should callers stop knowing about?
- What invariants can the module own?
- What error modes are part of the interface?
- Which dependencies are hidden, injected, or adapted?
- How would a caller use this in the common case?
- Would tests survive a complete rewrite of the implementation?

## Design It Twice

For important seams, compare at least two materially different interfaces:

1. **Minimal interface**: one to three entry points, maximum leverage per call.
2. **Flexible interface**: supports known variations explicitly.
3. **Common-case interface**: makes the main path almost trivial.
4. **Ports-and-adapters interface**: when owned remote dependencies require a seam.

Compare options by depth, locality, dependency handling, and caller ergonomics. Recommend one design or a deliberate hybrid; do not present a neutral menu when the evidence favors an option.
