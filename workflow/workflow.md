# Linux Command Line Practical Workflow

## Phase 1 — Create and Switch to `student01`

### Step 1: Open the terminal

**Action:** Open the Kali Linux terminal.

**Command:** No command required.

**Expected result:** A terminal is available.

**Evidence:** Optional screenshot of the terminal before beginning.

### Step 2: Create `student01`

**Run as:** Existing account with permission to create users / administrator.

```bash
sudo useradd -m -s /bin/bash student01
```

**Purpose:** Creates the requested user and a home directory.

**Expected result:** The user is created without an error.

**Verification:**

```bash
getent passwd student01
```

### Step 3: Set the password

**Run as:** Administrator/sudo-capable account.

```bash
sudo passwd student01
```

**Purpose:** Sets the password for `student01`.

**Expected result:** Linux asks for and accepts a new password.

**Evidence:** Do not record or screenshot the password itself.

### Step 4: Add to sudo group if required

The original task says to add the user to the `sudo` group **if required**.

If it is required in your Kali setup:

```bash
sudo usermod -aG sudo student01
```

**Verification:**

```bash
groups student01
```

### Step 5: Switch to `student01`

```bash
su - student01
```

**Expected result:** Your shell changes to the `student01` account.

### Step 6: Confirm the account

```bash
whoami
```

**Expected result:**

```text
student01
```

**Evidence:** Capture the `whoami` command and its actual output.

---

## Phase 2 — Create the Directory Structure

**Run as:** `student01`

Go to the new user's home directory:

```bash
cd ~
```

Create the required directories:

```bash
mkdir -p project/docs project/scripts project/bin
```

Verify:

```bash
ls -la project
```

**Expected structure:**

```text
project/
├── bin
├── docs
└── scripts
```

**Evidence:** Capture the directory listing.

---

## Phase 3 — Create the Required Files

### Step 1: Enter `docs`

```bash
cd ~/project/docs
```

### Step 2: Create `report.txt` with `echo`

```bash
echo "This is the initial report by student01." > report.txt
```

Verify:

```bash
cat report.txt
```

**Expected content:**

```text
This is the initial report by student01.
```

### Step 3: View hidden files

```bash
ls -la
```

At this point, Linux may show the normal `.` and `..` entries even before you create the required hidden file.

### Step 4: Create `.secret.txt`

```bash
echo "Top Secret." > .secret.txt
```

Verify:

```bash
ls -la
cat .secret.txt
```

**Expected content:**

```text
Top Secret.
```

**Evidence:** Capture a listing showing `.secret.txt` and its content if useful.

---

## Phase 4 — Edit, Copy, Move, and Rename

### Step 1: Edit `report.txt` with Nano

```bash
nano report.txt
```

Add this as the second line:

```text
Appended line using nano.
```

Save and exit Nano.

Verify:

```bash
cat report.txt
```

**Expected content:**

```text
This is the initial report by student01.
Appended line using nano.
```

### Step 2: Copy `report.txt` to `scripts`

```bash
cp report.txt ../scripts/
```

Verify:

```bash
ls -la ../scripts
```

### Step 3: Move and rename `.secret.txt`

```bash
mv .secret.txt ../bin/classified.txt
```

Verify:

```bash
ls -la ../bin
```

The file should now be named:

```text
classified.txt
```

### Step 4: Create `install.sh`

Move to `scripts`:

```bash
cd ../scripts
```

Create the file:

```bash
nano install.sh
```

Enter exactly:

```bash
#!/bin/bash
echo "Installing project dependencies..."
```

Save and exit.

Verify:

```bash
cat install.sh
```

---

## Phase 5 — Configure Permissions

### Step 1: Make `install.sh` executable by all users

**Run as:** `student01`

The requirement is that all users have execute permission. Use a `chmod` command that adds execute permission for user, group, and others:

```bash
chmod a+x install.sh
```

Verify:

```bash
ls -l install.sh
```

Look for `x` in all three permission sections.

### Step 2: Remove read permission for others from `classified.txt`

Go to `bin`:

```bash
cd ../bin
```

Run:

```bash
chmod o-r classified.txt
```

**Meaning:**
- `o` = others
- `-r` = remove read permission

Verify:

```bash
ls -l classified.txt
```

### Step 3: Create `admin_notes.txt`

Go to `docs`:

```bash
cd ../docs
```

Create the file:

```bash
touch admin_notes.txt
```

Set permissions so only the owner can read and write:

```bash
chmod u=rw,go= admin_notes.txt
```

**Meaning:**
- `u=rw` → owner can read and write
- `go=` → group and others receive no permissions

Verify:

```bash
ls -l admin_notes.txt
```

The exact displayed permission string should be checked from your system.

---

## Phase 6 — Clean Up and Create the Backup

### Step 1: Delete `admin_notes.txt`

```bash
rm admin_notes.txt
```

Verify:

```bash
ls -la
```

### Step 2: Create `backup`

Go to the project directory:

```bash
cd ..
mkdir backup
```

### Step 3: Copy the contents of `docs` and `scripts` into `backup`

The task says to copy the entire content of both directories into `backup`.

One direct approach is:

```bash
cp -r docs/. backup/
cp -r scripts/. backup/
```

Verify:

```bash
ls -la backup
```

**Important:** The two source directories contain files with different names in this task, so there should not be a filename collision between the listed source files.

---

## Phase 7 — Final Verification

Go to the home directory:

```bash
cd ~
```

Run:

```bash
tree project
```

If `tree` is not installed, follow the original task's instruction:

```bash
sudo apt install tree
```

Then run:

```bash
tree project
```

Also inspect permissions and locations:

```bash
ls -la project/docs
ls -la project/scripts
ls -la project/bin
ls -la project/backup
```

### What to verify

- `report.txt` exists in `docs`.
- `report.txt` was copied to `scripts`.
- `install.sh` exists in `scripts`.
- `classified.txt` exists in `bin`.
- `admin_notes.txt` has been deleted.
- `backup` exists.
- The contents of `docs` and `scripts` were copied into `backup`.
- `install.sh` has execute permission for all users.
- `classified.txt` no longer gives read permission to others.
- `admin_notes.txt` had owner-only read/write permissions before deletion.

---

## Phase 8 — Optional Command History

The activity's bonus asks you to use:

```bash
history
```

to list commands used.

To redirect the history to the required file:

```bash
history > ~/commands_used.txt
```

Verify:

```bash
cat ~/commands_used.txt
```

This is optional according to the original activity.

---

## Final Verification Checklist

- [ ] `student01` created
- [ ] Password set
- [ ] `student01` added to `sudo` group if required
- [ ] Switched to `student01`
- [ ] `whoami` confirmed `student01`
- [ ] `project` created
- [ ] `docs`, `scripts`, and `bin` created
- [ ] `report.txt` created with required first line
- [ ] `.secret.txt` created with `Top Secret.`
- [ ] `report.txt` edited with Nano
- [ ] `report.txt` copied to `scripts`
- [ ] `.secret.txt` moved and renamed to `classified.txt`
- [ ] `install.sh` created with required content
- [ ] `install.sh` made executable by all users
- [ ] Read permission for others removed from `classified.txt`
- [ ] `admin_notes.txt` created with owner-only read/write permissions
- [ ] `admin_notes.txt` deleted
- [ ] `backup` created
- [ ] Contents of `docs` and `scripts` copied into `backup`
- [ ] `tree project` checked
- [ ] `ls -la` checks completed
- [ ] Optional `commands_used.txt` created if completing the bonus
- [ ] Evidence/screenshots collected if desired for documentation
