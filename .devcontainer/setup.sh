#!/bin/bash
set -e

echo "Setting up Python environment..."
python -m venv .venv
.venv/bin/pip install --upgrade pip
.venv/bin/pip install -r requirements.txt

echo "Installing Jupyter kernel..."
.venv/bin/python -m ipykernel install --user --name=workshop-gds --display-name="Python (workshop-gds)"

echo "Configuring Neo4j credentials..."
cat > .env << EOF
# Neo4j Connection Credentials
# These are pre-configured for the local Neo4j instance running in this Codespace

# Neo4j Connection URI
NEO4J_URI=bolt://localhost:7687

# Neo4j Username
NEO4J_USERNAME=neo4j

# Neo4j Password
NEO4J_PASSWORD=workshoppassword
EOF

echo "Waiting for Neo4j to be ready..."
max_attempts=30
attempt=0
while [ $attempt -lt $max_attempts ]; do
    if wget --quiet --tries=1 --spider http://localhost:7474 2>/dev/null; then
        echo "Neo4j is ready!"
        break
    fi
    attempt=$((attempt + 1))
    echo "Waiting for Neo4j... (attempt $attempt/$max_attempts)"
    sleep 2
done

if [ $attempt -eq $max_attempts ]; then
    echo "Warning: Neo4j may not be fully ready yet. Please wait a moment before running notebooks."
else
    echo "Verifying APOC and GDS plugins..."
    sleep 5  # Give Neo4j a bit more time to fully initialize plugins
    bash .devcontainer/verify-neo4j.sh || echo "Warning: Plugin verification incomplete. Neo4j may still be initializing."
fi

echo "Setup complete!"

