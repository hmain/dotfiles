---
inclusion: fileMatch
fileMatchPattern: '**/agent*,**/strands*,**/prompts.py,**/bedrock*'
---

# Strands / AgentCore Rules

- Always use Strands and AgentCore when creating agents in projects.
- Always consult Strands MCP before creating agents and tools if available.
- If Strands MCP or AgentCore docs are unavailable, state that clearly and avoid guessing.
- Always keep single agent prompts in a `prompts.py` file.
- Always use the EU inference profile for Bedrock models and fetch the model ARN using the AWS CLI.
- Always use structured output when able/applicable.
- Enable AgentCore observability when the runtime hosts the agent and the region supports it. Do not wrap agent entrypoints with Powertools `Tracer` — AgentCore handles it. Custom tool metrics still go via Powertools `Metrics`. See `observability.md`.
