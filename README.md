# Graph Data Science Workshop

A hands-on workshop for learning the Neo4j Graph Data Science (GDS) Python client.

## What You'll Learn

Analyze a real citation network using graph algorithms:
- **PageRank** - Find influential papers
- **Betweenness Centrality** - Identify bridge papers connecting research areas
- **Louvain Communities** - Detect research clusters
- **FastRP Embeddings** - Create vector representations for machine learning
- **K-Means Clustering** - Group papers by similarity

## Setup

**GitHub Codespaces** (Recommended):
1. Click "Create codespace on main"
2. Wait 2-3 minutes for automatic setup
3. Open `notebooks/1_citation_setup.ipynb`
4. Start learning!

Everything is pre-configured: Neo4j + GDS + Python environment.

**Local Development**:
1. Install Python 3.11+
2. Run: `pip install -r requirements.txt`
3. Set up Neo4j (Desktop or Sandbox)
4. Copy `env.template` to `.env` and add your credentials
5. Start Jupyter: `jupyter notebook notebooks/`

## Notebooks

Work through in order:
1. `1_citation_setup.ipynb` - Setup and PageRank
2. `2_bridge_papers.ipynb` - Betweenness analysis
3. `3_communities_features.ipynb` - Communities and feature engineering
4. `4_similarity_prediction.ipynb` - Embeddings and clustering

---

Workshop content by Neo4j GraphAcademy

