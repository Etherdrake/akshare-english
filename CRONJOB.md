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
    "message": "Execute autonomous update:\n\n1. cd ~/clawd/akshare-english\n2. Set SSH: export GIT_SSH_COMMAND=\"ssh -i ~/.ssh/akshare_english_deploy -o IdentitiesOnly=yes\"\n3. git add -A && git commit -m \"Auto-update: $(date '+%Y-%m-%d %H:%M')\" 2>/dev/null || echo \"No changes\"\n4. git pull origin main --rebase\n5. pip install -q mkdocs mkdocs-material && mkdocs gh-deploy --force 2>/dev/null || echo \"Deploy skip\"\n6. git push origin main\n\nReply with UPDATE_COMPLETE when done."
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

1. **Commits local changes** (docs you edit)
2. **Pulls upstream** (syncs with GitHub)
3. **Deploys to GitHub Pages** (`mkdocs gh-deploy`)
4. **Pushes to main branch**

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
