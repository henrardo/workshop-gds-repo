# Graph Data Science Workshop - Python Module

Welcome to the hands-on Python GDS Client module of the Graph Data Science workshop!

## 🎯 What You'll Learn

In this module, you'll analyze a real academic citation network using the Python GDS Client:

- **Setup & PageRank**: Connect to Neo4j, load data, find influential papers
- **Betweenness Centrality**: Identify bridge papers connecting research areas
- **Community Detection**: Discover research clusters using Louvain algorithm
- **Node Embeddings**: Create FastRP embeddings and predict citations

## 🚀 Quick Start (GitHub Codespaces)

**Easiest way to get started:**

1. Click the button below to open this repository in GitHub Codespaces:

   [![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://github.com/codespaces/new/henrardo/workshop-gds)

2. Wait for the environment to set up (~2-3 minutes)
3. Get your Neo4j credentials from your instructor
4. Update the `.env` file with your credentials
5. Open `notebooks/1_citation_setup.ipynb` and start coding!

**That's it!** All dependencies are pre-installed.

## 🖥️ Local Development Setup

Prefer to work locally? You'll need:

### Prerequisites
- Python 3.11+
- Jupyter Notebook or JupyterLab
- Neo4j Database (Sandbox or Aura)

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/henrardo/workshop-gds.git
   cd workshop-gds
   ```

2. Create a virtual environment:
   ```bash
   python -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   ```

3. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

4. Set up environment variables:
   ```bash
   cp .env.example .env
   # Edit .env with your Neo4j credentials
   ```

5. Start Jupyter:
   ```bash
   jupyter notebook notebooks/
   ```

## 📚 Notebooks

Work through the notebooks in order:

1. **1_citation_setup.ipynb** - Setup, data loading, and PageRank analysis
2. **2_bridge_papers.ipynb** - Betweenness Centrality for bridge detection
3. **3_communities_features.ipynb** - Louvain communities and feature engineering
4. **4_similarity_prediction.ipynb** - FastRP embeddings and link prediction

## 🗄️ Dataset

This module uses the **Cora Citation Network**:
- **2,708** academic papers
- **10,556** citation relationships
- **7** subject areas (Neural Networks, Reinforcement Learning, Theory, etc.)
- **1,433** content features per paper

## 🔧 Neo4j Setup

### Option 1: Neo4j Sandbox (Recommended for workshop)
Your instructor will provide sandbox credentials.

### Option 2: Neo4j Aura (Free tier)
1. Go to https://neo4j.com/cloud/aura/
2. Create a free AuraDB instance
3. Save your credentials
4. Update `.env` with your URI, username, and password

### Option 3: Local Neo4j Desktop
1. Download from https://neo4j.com/download/
2. Create a new database (version 5.x)
3. Install GDS plugin (version 2.x)
4. Update `.env` with `bolt://localhost:7687`

## 📖 Documentation

- [Python GDS Client Docs](https://neo4j.com/docs/graph-data-science-client/current/)
- [GDS Library Docs](https://neo4j.com/docs/graph-data-science/current/)
- [GraphAcademy Courses](https://graphacademy.neo4j.com/)

## ❓ Getting Help

- **During Workshop**: Ask your instructor
- **After Workshop**: 
  - [Neo4j Community Forum](https://community.neo4j.com/)
  - [Discord](https://discord.gg/neo4j)
  - [Stack Overflow](https://stackoverflow.com/questions/tagged/neo4j)

## 📝 License

This workshop content is provided by Neo4j GraphAcademy for educational purposes.

---

**Ready?** Open `notebooks/1_citation_setup.ipynb` and let's get started! 🚀

