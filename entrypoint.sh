#!/bin/bash

if ! command -v curl >/dev/null 2>&1; then
  echo "Installing curl"
  apt-get update && apt-get install -y curl jq
fi

/bin/ollama serve &
pid=$!

echo "starting Ollama..."
sleep 10

until curl -s http://localhost:11434 >/dev/null; do
  echo "Ollama is not ready yet.. wait for 2 more seconds"
  sleep 2
done

echo "Ollama started"

ollama pull hf.co/Qwen/Qwen1.5-4B-Chat-GGUF
ollama pull hf.co/TinyLlama/TinyLlama-1.1B-Chat-v0.2-GGUF

echo "Done models loading:"
echo ""

curl -s http://localhost:11434/api/tags | jq -r '.models[].name'

echo ""
echo "Model loading and logging completed."

wait $pid
