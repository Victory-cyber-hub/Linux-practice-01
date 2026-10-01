#!/bin/bash

# LINUX COMMAND LINE PRACTICAL TASK
# Reference commands only.
# Do not run this file blindly: passwd, su, and nano require manual interaction,
# and user creation should be understood before execution.

# ============================================================
# PHASE 1 — CREATE student01
# Run these administrator-level commands from an existing
# account that has sudo privileges.
# ============================================================

sudo useradd -m -s /bin/bash student01

# Set the password interactively:
sudo passwd student01

# Only if the task requires the user to be in sudo:
sudo usermod -aG sudo student01

# Verify the user/group information:
getent passwd student01
groups student01

# Switch to the required user interactively:
su - student01

# Confirm:
whoami

# ============================================================
# PHASE 2 — DIRECTORY STRUCTURE
# Run as student01.
# ============================================================

cd ~
mkdir -p project/docs project/scripts project/bin
ls -la project

# ============================================================
# PHASE 3 — FILE CREATION
# ============================================================

cd ~/project/docs

echo "This is the initial report by student01." > report.txt
cat report.txt

ls -la

echo "Top Secret." > .secret.txt
ls -la
cat .secret.txt

# ============================================================
# PHASE 4 — EDIT / COPY / MOVE
# ============================================================

# Interactive: open report.txt and add the required second line.
nano report.txt

cat report.txt

cp report.txt ../scripts/
ls -la ../scripts

mv .secret.txt ../bin/classified.txt
ls -la ../bin

cd ../scripts

# Interactive: create install.sh with the required content.
nano install.sh

cat install.sh

# ============================================================
# PHASE 5 — PERMISSIONS
# ============================================================

chmod a+x install.sh
ls -l install.sh

cd ../bin
chmod o-r classified.txt
ls -l classified.txt

cd ../docs
touch admin_notes.txt
chmod u=rw,go= admin_notes.txt
ls -l admin_notes.txt

# ============================================================
# PHASE 6 — CLEANUP / BACKUP
# ============================================================

rm admin_notes.txt
ls -la

cd ..
mkdir backup

cp -r docs/. backup/
cp -r scripts/. backup/

ls -la backup

# ============================================================
# PHASE 7 — FINAL CHECKS
# ============================================================

cd ~
tree project

ls -la project/docs
ls -la project/scripts
ls -la project/bin
ls -la project/backup

# ============================================================
# BONUS — COMMAND HISTORY
# ============================================================

history > ~/commands_used.txt
cat ~/commands_used.txt
