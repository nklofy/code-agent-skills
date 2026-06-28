# Example: Idea To Issues

This example shows how an agent can use the bundle without command prefixes or platform setup.

## User Input

```text
I want users to invite teammates by email. The invite should expire after 7 days.
```

## Step 1: Grill The Idea

Use **Mattpocock Grill Me** because the idea has open decisions.

Good next question:

```text
Question: Who can send invitations?
Recommended answer: workspace admins only.
Why: it gives the first slice a clear permission rule and avoids designing role escalation too early.
```

After a few questions, the decision summary might be:

```md
## Resolved Decisions

- Workspace admins can invite teammates by email.
- An invitation expires 7 days after creation.
- The first slice covers creating and accepting an invitation.
- Resending, revoking, and custom roles are out of scope.

## Assumptions

- Email delivery can be represented by a test adapter in the first slice.
```

## Step 2: Write The PRD

Use **Mattpocock To PRD** when the idea is settled enough to preserve.

Output:

```text
.scratch/team-invitations/PRD.md
```

Minimal PRD shape:

```md
# Team Invitations

Status: ready-for-agent

## Problem Statement

Workspace admins need a controlled way to invite teammates without manually creating accounts.

## Solution

Admins can create email invitations that expire after 7 days. Invitees can accept valid invitations to join the workspace.

## User Stories

1. As a workspace admin, I want to invite a teammate by email, so that they can join without manual account creation.
2. As an invitee, I want expired invitations to be rejected, so that stale access cannot be used.

## Testing Decisions

- Test through the invitation module interface.
- Use a fake email adapter for delivery.
- Verify behavior through create invitation and accept invitation flows.
```

## Step 3: Split Issues

Use **Mattpocock To Issues** when the PRD is too large for one implementation pass.

Output:

```text
.scratch/team-invitations/issues/01-create-invitation.md
.scratch/team-invitations/issues/02-accept-invitation.md
.scratch/team-invitations/issues/03-expire-invitation.md
```

Example issue:

```md
# Create Invitation

Status: ready-for-agent

## What To Build

Allow a workspace admin to create a teammate invitation for an email address.

## Acceptance Criteria

- [ ] Admin can create an invitation for an email address.
- [ ] Invitation has a 7-day expiration timestamp.
- [ ] A fake email adapter receives the invitation delivery request.

## Test Seam

Invitation module interface.

## Blocked By

None - can start immediately.
```

## Step 4: Implement With Mattpocock TDD

Use **Mattpocock TDD** for one issue at a time.

First red-green cycle:

```text
RED: admin creates invitation and fake email adapter receives one message.
GREEN: implement the minimal invitation creation path.
REFACTOR: move expiration calculation behind the invitation module interface if it leaks into callers.
```

## Step 5: Improve Architecture When Needed

Use **Mattpocock Improve Codebase Architecture** if invitation logic spreads across controllers, mailers, repositories, and tests.

Candidate:

```text
Deepen the invitation module so callers use one interface and tests verify behavior through that interface.
```
