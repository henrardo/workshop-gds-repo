# Push to GitHub Instructions

This file contains quick instructions for pushing this repository to GitHub.

## Repository Info
- GitHub Repo: `henrardo/workshop-gds`
- URL: https://github.com/henrardo/workshop-gds

## Steps to Push

### 1. Initialize Git (if not already done)
```bash
cd /path/to/workshop-gds-repo
git init
```

### 2. Add Remote
```bash
git remote add origin https://github.com/henrardo/workshop-gds.git
```

### 3. Create Initial Commit
```bash
git add .
git commit -m "Initial commit: GDS workshop Python module setup

- Added devcontainer configuration for GitHub Codespaces
- Added 4 Jupyter notebooks for citation network analysis
- Added requirements.txt with GDS Python client
- Added README with setup instructions
- Added .env.example for Neo4j credentials
"
```

### 4. Push to GitHub
```bash
git branch -M main
git push -u origin main
```

## After Pushing

### Test the Codespace
1. Go to: https://github.com/henrardo/workshop-gds
2. Click "Code" → "Codespaces" → "Create codespace on main"
3. Wait for setup to complete (~2-3 minutes)
4. Verify:
   - Python packages installed
   - `.env` file created from `.env.example`
   - Notebooks open correctly
   - Jupyter kernel starts

### Update Course Configuration
In the course repository, update:
```asciidoc
:repository: henrardo/workshop-gds
```

This will make the "Open in GitHub Codespace" button work in the lesson.

### When Ready to Transfer
Once tested and working:
1. Go to repository Settings
2. Scroll to "Danger Zone"
3. Click "Transfer ownership"
4. Transfer to: `neo4j-graphacademy`
5. Update course.adoc: `:repository: neo4j-graphacademy/workshop-gds`

## Quick Copy Commands

If you're copying this folder to another location:
```bash
# Copy the entire folder
cp -r /Users/henryadamcollie/Documents/GitHub/neo4j-graphacademy/courses/workshop-gds-repo /path/to/new/location/workshop-gds

# Then cd and push
cd /path/to/new/location/workshop-gds
git init
git remote add origin https://github.com/henrardo/workshop-gds.git
git add .
git commit -m "Initial commit: GDS workshop Python module"
git branch -M main
git push -u origin main
```

---

**Delete this file before final push if desired** (optional - it's just for reference)

