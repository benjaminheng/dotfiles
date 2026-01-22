---
allowed-tools: Bash(jj status:*), Bash(jj log:*), Bash(gh pr view:*), Bash(gh pr checks:*), Bash(gh run view:*), Bash(gh run list:*)
description: Fix failing CI tests in a PR
---

This command helps diagnose and plan fixes for failing CI tests. Provide a PR URL or number.

## Step 1: View PR status checks

Get quick status summary:

```
gh pr checks <PR_NUMBER>
```

Get detailed status in JSON:

```
gh pr view <PR_NUMBER> --json statusCheckRollup
```

## Step 2: List recent workflow runs

```
gh run list --limit 10
```

## Step 3: Inspect failed run

View run details (focus on `unit-tests` job):

```
gh run view <RUN_ID>
```

Get detailed job information:

```
gh run view <RUN_ID> --json "jobs,conclusion,displayTitle,headBranch"
```

## Step 4: View job logs

View logs for failed job:

```
gh run view --job <JOB_ID> --log
```

## Step 5: Analyze, plan, and fix

Based on the logs, identify the root cause of the test failures and apply a fix.

1. Identify the root cause of test failures.
2. Read relevant files, including tests and other code.
3. Make a plan and suggest specific fixes to address the failures.
