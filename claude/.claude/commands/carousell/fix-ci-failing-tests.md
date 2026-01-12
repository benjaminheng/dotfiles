---
allowed-tools: Bash(jj status:*), Bash(jj log:*), Bash(gh pr view:*), Bash(gh pr checks:*), Bash(gh run view:*), Bash(gh run list:*)
description: Fix failing CI tests in a PR
---

This command helps diagnose and plan fixes for failing CI tests. Provide a PR URL or number.

## Step 1: View PR Status Checks

Get quick status summary:

```
gh pr checks <PR_NUMBER>
```

Get detailed status in JSON:

```
gh pr view <PR_NUMBER> --json statusCheckRollup
```

## Step 2: List Recent Workflow Runs

```
gh run list --limit 10
```

## Step 3: Inspect Failed Run

View run details (focus on `unit-tests` job):

```
gh run view <RUN_ID>
```

Get detailed job information:

```
gh run view <RUN_ID> --json "jobs,conclusion,displayTitle,headBranch"
```

## Step 4: View Job Logs

View logs for failed job:

```
gh run view --job <JOB_ID> --log
```

## Step 5: Analyze and Plan

Based on the logs:
1. Identify the root cause of test failures
2. Check relevant test files in the codebase
3. Suggest specific fixes to address the failures
