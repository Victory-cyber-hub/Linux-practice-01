# Task Overview

## Objective

Demonstrate understanding of basic Linux commands by completing the activity as a newly created user in Kali Linux.

## Required User

`student01`

## Main Stages

1. Create and switch to `student01`.
2. Create the `project` directory and `docs`, `scripts`, and `bin` subdirectories.
3. Create `report.txt` in `docs`.
4. View hidden files with `ls -la`.
5. Create `.secret.txt`.
6. Edit `report.txt` with `nano`.
7. Copy `report.txt` to `scripts`.
8. Move `.secret.txt` to `bin` and rename it `classified.txt`.
9. Create `install.sh` with the specified Bash content.
10. Configure permissions using `chmod`.
11. Delete `admin_notes.txt`.
12. Create `backup` and copy the contents of `docs` and `scripts` into it.
13. Verify using `tree project` and `ls -la`.
14. Optionally save command history to `commands_used.txt`.

## Required Content

`report.txt` starts with:

```text
This is the initial report by student01.
```

A second line is added using `nano`:

```text
Appended line using nano.
```

`.secret.txt` contains:

```text
Top Secret.
```

`install.sh` contains:

```bash
#!/bin/bash
echo "Installing project dependencies..."
```

## Important Instruction

The original activity does not provide exact numeric `chmod` modes. The workflow therefore explains the permission targets without inventing a numeric mode.
