# Linux Command Line Practical Task

## Project Description

This repository is a GitHub-ready workflow for completing the **Linux Command Line Practical Task** in Kali Linux.

The activity focuses on basic Linux user management, directory and file management, file editing, moving/copying files, permissions with `chmod`, cleanup, backups, and final verification.

> This repository is a workflow/template. It does not contain fabricated command output, screenshots, or completed results.

## Objective

Demonstrate understanding of basic Linux commands by completing the task as a newly created user in Kali Linux.

## Requirements From the Activity

- Create a user named `student01`.
- Set a password.
- Add the user to the `sudo` group if required.
- Switch to `student01` and verify with `whoami`.
- Create the required `project` directory structure.
- Create and edit `report.txt`.
- Create the hidden `.secret.txt`.
- Copy and move/rename files as specified.
- Create `install.sh` with the required content.
- Configure the required permissions with `chmod`.
- Delete `admin_notes.txt`.
- Create `backup` and copy the contents of `docs` and `scripts` into it.
- Verify the final structure with `tree project` and `ls -la`.
- Optionally save command history to `commands_used.txt`.

## Tools

- Kali Linux
- Terminal
- Bash
- `useradd`
- `passwd`
- `usermod`
- `su` or login
- `whoami`
- `mkdir`
- `cd`
- `echo`
- `ls`
- `nano`
- `cp`
- `mv`
- `chmod`
- `rm`
- `tree`
- `history`
- shell redirection (`>`)

## Prerequisites

- A working Kali Linux installation or VM.
- An account with permission to create the `student01` user.
- Terminal access.
- `tree` installed for the final directory-tree check, or permission to install it with `sudo apt install tree`.

## Project Structure

```text
linux-command-line-practical-task/
├── README.md
├── .gitignore
├── docs/
│   ├── README.md
│   └── task-overview.md
├── workflow/
│   ├── README.md
│   └── workflow.md
├── commands/
│   ├── README.md
│   └── commands.sh
├── scripts/
│   ├── README.md
│   └── verify.sh
├── evidence/
│   ├── README.md
│   ├── screenshots/
│   │   └── .gitkeep
│   └── terminal-output/
│       └── .gitkeep
└── submission/
    ├── README.md
    ├── command-history.txt
    └── final-output.txt
```

## Workflow

Follow `workflow/workflow.md` in order. The commands file is a reference and is intentionally not an automatic one-click lab script because several steps are interactive and the assignment is intended to demonstrate your own command-line work.

## Important Permission Rule

The activity requires work to be completed as the newly created user. Administrator-level commands are clearly marked where applicable. Do not silently replace the required user or permission process with another account.

## Expected Final Project Layout

After completing the task, the activity should produce a `project` directory containing:

```text
project/
├── docs/
│   └── report.txt
├── scripts/
│   ├── report.txt
│   └── install.sh
├── bin/
│   └── classified.txt
└── backup/
    └── copies of the contents of docs and scripts
```

The exact permission listings and command output must come from your own Kali system.

## Evidence

See `evidence/README.md` for suggested screenshots and what each one should prove. The original activity does not explicitly require screenshots, so these are documentation suggestions rather than invented assignment requirements.

## Submission

See `submission/README.md`. The original activity provides final checks and an optional command-history step; it does not specify a separate submission format.

## Troubleshooting

### `tree: command not found`

The activity instructs you to install it if necessary:

```bash
sudo apt install tree
```

### I am not sure which user I am using

Run:

```bash
whoami
```

The required account for the main activity is:

```text
student01
```

### A hidden file is not showing with `ls`

Use:

```bash
ls -la
```

The `-a` option displays hidden entries.

## Safety Notes

- Read commands before running them.
- Be especially careful with `rm`, because it deletes files.
- Do not run commands against unrelated directories.
- Do not fabricate screenshots or terminal results.
