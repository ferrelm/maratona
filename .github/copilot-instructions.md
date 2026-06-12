# Copilot & AI Agent Instructions — RUN 4 FUN Maratona 2027

**(Canonical entry point for GitHub Copilot in this repository.)**

Decision-support site for the group's 2027 international marathon trip
(candidates: Athens, Budapest). Plain static HTML — no build step, no
framework; root files are served as-is.

## Authoritative sources

- `CLAUDE.md` — operational rules (file map, reference rules).
- `AGENTS.md` — short bridge for coding agents.
- `docs/GOVERNANCE-AI-MODELS.md` — model-usage and tool-routing rules.

## Working rules

- **Every factual or numeric claim** (dates, prices, distances, race slots,
  registration deadlines) needs a numbered inline reference
  (`<a href="#ref-n" class="ref">[n]</a>`) plus a clickable bibliography
  entry (`<li id="ref-n"><a href="URL" …>Source — description</a></li>`),
  or an explicit estimate marker.
- Never renumber or reuse existing `ref-n` ids; new sources get the next number.
- Prefer official/primary sources (race organisers, operators, official
  bodies) over aggregators; declare uncertainty when evidence is incomplete.
- `backup/` and `dumps/` hold snapshot evidence — do not edit or delete.
- Do not introduce frameworks, package managers, or build tooling.

## Context efficiency

- Do not read whole HTML pages; search for the relevant section first and
  read only that range.
- Do not spawn subagents or parallel agent runs unless explicitly requested.
- Quote file paths and line ranges instead of dumping file contents.
