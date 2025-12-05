# Cora Citation Network Dataset

This folder should contain the Cora citation network dataset files.

## Required Files

You need two files:
- `cora.cites` - Citation relationships (edges)
- `cora.content` - Paper content and classifications (nodes)

## How to Get the Dataset

### Option 1: Download from Official Source
Download from: https://linqs.org/datasets/#cora

### Option 2: Use Pre-processed Version
The notebooks include code to download and process the dataset automatically.

### Option 3: Manual Download
```bash
# From this directory
wget https://linqs-data.soe.ucsc.edu/public/lbc/cora.tgz
tar -xzf cora.tgz
```

## Dataset Details

- **2,708** papers (nodes)
- **10,556** citations (edges)
- **7** subject classifications
- **1,433** binary word features per paper

## File Formats

### cora.cites
```
paper_id_1  paper_id_2
paper_id_3  paper_id_2
...
```
Each line represents a citation: paper_id_1 cites paper_id_2

### cora.content
```
paper_id  word_1  word_2  ...  word_1433  subject_label
```
Each line: paper ID, binary word features (0/1), and subject classification

## Subject Classifications

1. Case_Based
2. Genetic_Algorithms
3. Neural_Networks
4. Probabilistic_Methods
5. Reinforcement_Learning
6. Rule_Learning
7. Theory

---

**Note**: The notebooks will load this data into Neo4j automatically.

