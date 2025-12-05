# Troubleshooting Guide

Common issues and solutions for the Graph Data Science Workshop.

## Notebook Issues

### "Select Kernel" prompt appears
**Problem**: Jupyter asks you to select a kernel when opening notebooks.

**Solution**: 
1. Click "Select Kernel" in the top-right of the notebook
2. Choose "Python Environments"
3. Select "Python (workshop-gds)" or ".venv/bin/python"

The kernel should auto-select on subsequent opens.

### ImportError: No module named 'graphdatascience'
**Problem**: Python can't find the GDS client.

**Solution**: Make sure the correct kernel is selected:
- Check top-right of notebook shows "Python (workshop-gds)"
- If not, click kernel selector and choose the workshop environment

## Neo4j Issues

### "Unknown function 'apoc.convert.fromJsonList'"
**Problem**: APOC plugin is not loaded or Neo4j is still starting.

**Solutions**:
1. **Wait a moment**: Neo4j may still be initializing (takes ~30-60 seconds)
2. **Verify APOC is installed**:
   ```bash
   bash .devcontainer/verify-neo4j.sh
   ```
3. **Restart Neo4j**:
   ```bash
   docker restart workshop-neo4j
   ```
4. **Check logs**:
   ```bash
   docker logs workshop-neo4j | grep -i apoc
   ```

### "ServiceUnavailable: Connection refused"
**Problem**: Neo4j is not running or not ready yet.

**Solutions**:
1. **Check if Neo4j is running**:
   ```bash
   docker ps | grep neo4j
   ```
2. **Check Neo4j health**:
   ```bash
   curl http://localhost:7474
   ```
3. **Restart Neo4j**:
   ```bash
   docker restart workshop-neo4j
   sleep 30  # Wait for startup
   ```
4. **View logs**:
   ```bash
   docker logs workshop-neo4j --tail 50
   ```

### "Unknown function 'gds.version'"
**Problem**: GDS plugin is not loaded.

**Solution**: Check GDS is enabled:
```bash
docker logs workshop-neo4j | grep -i "graph data science"
```

Should see: "GraphDataScience: enabled"

## Environment Issues

### .env file is empty or missing
**Problem**: Credentials not configured.

**Solution**: Recreate .env file:
```bash
cat > .env << EOF
NEO4J_URI=bolt://localhost:7687
NEO4J_USERNAME=neo4j
NEO4J_PASSWORD=workshoppassword
EOF
```

### Virtual environment not activated
**Problem**: Terminal doesn't show `(.venv)` prefix.

**Solution**: Activate manually:
```bash
source .venv/bin/activate
```

Or open a new terminal (should auto-activate).

## Connection Issues

### Can't connect to Neo4j from Python
**Problem**: Authentication or network error.

**Diagnostic steps**:
1. **Verify .env file**:
   ```bash
   cat .env
   ```
   Should show correct credentials.

2. **Test connection with cypher-shell**:
   ```bash
   docker exec -it workshop-neo4j cypher-shell -u neo4j -p workshoppassword
   ```
   Type `:exit` to quit.

3. **Test from Python**:
   ```python
   from neo4j import GraphDatabase
   driver = GraphDatabase.driver(
       "bolt://localhost:7687",
       auth=("neo4j", "workshoppassword")
   )
   with driver.session() as session:
       result = session.run("RETURN 1 as num")
       print(result.single()["num"])
   driver.close()
   ```

## Performance Issues

### Neo4j runs slowly
**Problem**: Container resource constraints.

**Solutions**:
1. **Check memory usage**:
   ```bash
   docker stats workshop-neo4j
   ```

2. **Increase memory** (edit `.devcontainer/docker-compose.yml`):
   ```yaml
   - NEO4J_dbms_memory_heap_max__size=4G
   - NEO4J_dbms_memory_pagecache_size=1G
   ```

3. **Restart after changes**:
   ```bash
   docker-compose -f .devcontainer/docker-compose.yml restart
   ```

### Codespace is slow
**Problem**: Free tier Codespace (2-core) is limited.

**Solution**: Upgrade Codespace machine type:
1. Click Codespace name (bottom-left)
2. "Change Machine Type"
3. Select 4-core or higher

## Data Issues

### Papers already exist (duplicate errors)
**Problem**: Running data load cells multiple times.

**Solution**: Clear database and reload:
```python
# In a notebook cell
gds.run_cypher("MATCH (n) DETACH DELETE n")
```

Then re-run data loading cells.

### Graph projection already exists
**Problem**: Trying to create "cora-graph" when it exists.

**Solutions**:
1. **Use existing graph**:
   ```python
   G = gds.graph.get("cora-graph")
   ```

2. **Drop and recreate**:
   ```python
   gds.graph.drop("cora-graph")
   # Then run projection code again
   ```

3. **List all projections**:
   ```python
   gds.graph.list()
   ```

## Getting More Help

### View all container logs
```bash
docker-compose -f .devcontainer/docker-compose.yml logs
```

### Full environment reset
If nothing else works, rebuild the Codespace:
1. Close Codespace
2. Delete it from GitHub
3. Create a new one

This takes a few minutes but gives you a fresh start.

### Manual verification
Run the complete verification:
```bash
bash .devcontainer/verify-neo4j.sh
```

Should show all checkmarks (✓) for:
- Neo4j Connection
- APOC Plugin
- GDS Plugin  
- APOC JSON Functions

