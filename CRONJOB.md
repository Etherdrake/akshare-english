# OpenClaw Cronjob - AKShare English Documentation Auto-Update

## Files Created

```
~/clawd/akshare-english/
├── update_docs.sh        # Update script (executable)
└── CRONJOB.md           # This file

~/.ssh/
├── akshare_english_deploy      # Private key (600)
└── akshare_english_deploy.pub  # Public key
```

---

## Step 1: Add Deploy Key to GitHub

1. Copy this key:
```
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIM8npDb15K2GmQR+fM6t/i9jB3FU3U9V+JkPy74lhGOl akshare-english-deploy
```

2. Go to: https://github.com/Etherdrake/akshare-english/settings/keys

3. Click **"Add deploy key"**

4. Paste the key, enable **"Allow write access"**

5. Click **"Add key"**

---

## Step 2: Verify SSH Connection

```bash
ssh -i ~/.ssh/akshare_english_deploy -T git@github.com
```

Expected output: `Hi Etherdrake/akshare-english! You've successfully authenticated...`

---

## Step 3: Add OpenClaw Cronjob

Run this command:

```bash
openclaw cron add
```

Then paste this JSON when prompted:

```json
{
  "name": "akshare-english-update",
  "schedule": {
    "kind": "cron",
    "expr": "0 */6 * * *",
    "tz": "Europe/Amsterdam"
  },
  "payload": {
    "kind": "agentTurn",
    "message": "Execute autonomous AKShare documentation update:\n\n=== PHASE 1: Check for Upstream Changes ===\n1. cd ~/clawd/akshare-english\n2. Set SSH: export GIT_SSH_COMMAND=\"ssh -i ~/.ssh/akshare_english_deploy -o IdentitiesOnly=yes\"\n3. Check if upstream remote exists:\ngit remote get-url upstream 2>/dev/null || git remote add upstream https://github.com/akfamily/akshare.git\n4. Fetch upstream changes:\ngit fetch upstream\n5. Check for new files or modified docs:\necho \"=== Checking for upstream documentation changes ===\"\ngit diff --name-only HEAD...upstream/main -- '*.md' 'docs/**' | head -20\n\n=== PHASE 2: Fetch and Translate New Content ===\nIF new documentation files detected:\n1. Create temp directory: mkdir -p /tmp/akshare-translate && cd /tmp/akshare-translate\n2. Clone upstream repo shallowly: git clone --depth 1 https://github.com/akfamily/akshare.git\n3. Identify changed documentation files:\necho \"=== Changed documentation files ===\"\ncd akshare\nfor file in $(git diff --name-only HEAD...upstream/main -- '*.rst' 'docs/**' 2>/dev/null | grep -E '\\.(rst|md)$'); do\n  echo \"NEW/UPDATED: $file\"\n  # Read file content\n  content=$(cat \"$file\")\n  # Translate content to English (use web_fetch + translation service or manual)\n  # Create corresponding English file in ~/clawd/akshare-english/docs/\ndone\n\n=== PHASE 3: Update Local Repository ===\n1. cd ~/clawd/akshare-english\n2. Stage all changes: git add -A\n3. Commit with message: git commit -m \"Auto-sync: $(date '+%Y-%m-%d %H:%M') - Updated $(git diff --name-only --cached | wc -l) files\"\n4. Pull from origin: git pull origin main --rebase\n5. Build docs: pip install -q mkdocs mkdocs-material && mkdocs gh-deploy --force\n6. Push to origin: git push origin main\n\n=== PHASE 4: Report Status ===\nReply with:\n- UPDATE_COMPLETE if successful\n- UPDATE_NEEDED if manual translation required\n- ERROR: [error message] if failed\n\nInclude:\n- Number of files synced\n- Number of files requiring translation\n- GitHub Pages deployment status"
  },
  "delivery": {
    "mode": "announce",
    "channel": "main"
  },
  "enabled": true
}
```

---

## What It Does (Every 6 Hours)

### Phase 1: Check Upstream
1. Fetches latest from `https://github.com/akfamily/akshare`
2. Identifies new or modified documentation files

### Phase 2: Fetch & Translate
1. Clones upstream repo to temp directory
2. Compares with previous version
3. Identifies changed `.md` and `.rst` files
4. Translates new content to English

### Phase 3: Update
1. Commits changes to local repository
2. Deploys to GitHub Pages (`mkdocs gh-deploy`)
3. Pushes to main branch

### Phase 4: Report
1. Reports status back to main session
2. Lists files synced and pending translation

---

## Manual Translation Workflow (If Needed)

If upstream has major changes requiring manual translation:

```bash
cd ~/clawd/akshare-english

# Add upstream remote
git remote add upstream https://github.com/akfamily/akshare.git

# Fetch upstream
git fetch upstream

# Compare versions
git diff --stat HEAD...upstream/main

# Create new branch for translation
git checkout -b translate-$(date +%Y%m%d)

# Translate changed files in docs/
# Then commit and push

# Merge to main after review
git checkout main
git merge translate-$(date +%Y%m%d)
git push origin main
```

---

## Files to Monitor for Changes

| File Pattern | Description |
|--------------|-------------|
| `docs/*.md` | Documentation pages |
| `docs/**/*.md` | Nested documentation |
| `*.rst` | Sphinx documentation source |
| `README.md` | Project README |
| `CHANGELOG.md` | Version history |

---

## Manual Update (If Needed)

```bash
cd ~/clawd/akshare-english
export GIT_SSH_COMMAND="ssh -i ~/.ssh/akshare_english_deploy -o IdentitiesOnly=yes"
./update_docs.sh
```

---

## Security Notes

- **Private key** (`akshare_english_deploy`) stays on this machine only
- **Deploy key** is repository-specific (can't access other repos)
- Revoke key in GitHub Settings → Deploy keys if compromised
