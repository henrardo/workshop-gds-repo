# Quick Start Guide

Welcome to the Graph Data Science Workshop! Follow these steps to get started.

## 1. Wait for Setup (First Time Only)

When you first open the Codespace, wait 2-3 minutes for automatic setup:

- ⏳ Neo4j + GDS + APOC starting...
- ⏳ Python environment installing...
- ⏳ Dependencies downloading...
- ✅ Setup complete!

You'll see a welcome message when ready.

## 2. Open First Notebook

Navigate to: `notebooks/1_citation_setup.ipynb`

## 3. Select Python Kernel

**This is important!**

In the top-right corner of the notebook:
1. Click the kernel selector
2. Choose **"Python (workshop-gds)"** or **".venv"**

Not sure? Look for the Python environment that includes `workshop-gds` or is located in `.venv`.

## 4. Run Your First Cell

Click the play button (▶) or press `Shift+Enter` to run cells.

The first cell installs packages (should be instant since they're already installed).

## 5. Connect to Neo4j

When you reach the connection cell, you'll see:

```python
from dotenv import load_dotenv
load_dotenv()
# ... connection code ...
```

This loads your pre-configured credentials from `.env` - no editing needed!

Expected output:
```
Connected to GDS version: 2.x.x
Connected to: bolt://localhost:7687
```

## What's Pre-Configured

✅ **Neo4j Database**
- Running at `bolt://localhost:7687`
- Username: `neo4j`
- Password: `workshoppassword`
- Browse at: http://localhost:7474

✅ **Plugins**
- Graph Data Science (GDS)
- APOC procedures

✅ **Python Environment**
- Python 3.11
- GDS client
- Pandas, NumPy, scikit-learn
- Matplotlib, Seaborn
- Jupyter

✅ **Credentials**
- Stored in `.env` file
- Loaded automatically in notebooks
- No manual entry needed

## Common First Steps

### Check Neo4j is Ready
```bash
# In terminal
curl http://localhost:7474
```

Should return HTML (not an error).

### Verify Environment
```bash
# In terminal
bash .devcontainer/verify-neo4j.sh
```

Should show all ✓ checkmarks.

### Test Connection
```python
# In notebook cell
from dotenv import load_dotenv
import os
from graphdatascience import GraphDataScience

load_dotenv()
gds = GraphDataScience(
    os.getenv('NEO4J_URI'),
    auth=(os.getenv('NEO4J_USERNAME'), os.getenv('NEO4J_PASSWORD'))
)
print(f"GDS version: {gds.version()}")
```

## Notebook Workflow

Follow notebooks in order:

1. **1_citation_setup.ipynb** - Connect, load data, run PageRank
2. **2_bridge_papers.ipynb** - Betweenness centrality analysis
3. **3_communities_features.ipynb** - Louvain communities
4. **4_similarity_prediction.ipynb** - FastRP embeddings

Each notebook builds on the previous one.

## Tips

💡 **Run cells in order** - Don't skip cells (especially data loading)

💡 **Watch for errors** - Read error messages, they're usually helpful

💡 **Use Shift+Enter** - Fastest way to run cells

💡 **Kernel troubles?** - Restart kernel: Toolbar → Restart

💡 **Need help?** - Check `TROUBLESHOOTING.md`

## What You'll Build

By the end, you'll have:
- Loaded 2,708 academic papers into Neo4j
- Created citation network with 10,556 relationships
- Computed PageRank, Betweenness, Louvain communities
- Generated node embeddings with FastRP
- Built paper recommendation system

## Need Help?

- **Can't connect?** → See TROUBLESHOOTING.md
- **Kernel issues?** → See "Select Kernel" section above
- **APOC errors?** → Wait 30 seconds, Neo4j may still be starting
- **General issues?** → Check logs: `docker logs workshop-neo4j`

## Ready?

Open `notebooks/1_citation_setup.ipynb` and let's get started! 🚀

