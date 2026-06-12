# CLAUDE.md — RUN 4 FUN · Maratona Internacional 2027

Página de apoio à decisão da maratona internacional do grupo em 2027
(candidatas: Atenas, Budapeste). Site estático em HTML puro, sem build —
os ficheiros da raiz são servidos tal como estão.

## Mapa de ficheiros

| Ficheiro | Conteúdo |
|---|---|
| `index.html` | Página principal de apoio à decisão |
| `maratona-atenas.html`, `maratona-budapeste.html` | Dossiês das candidatas |
| `proposta-inicial-2027.html`, `sugestoes-fernando-2027.html` | Propostas |
| `docs/GOVERNANCE-AI-MODELS.md` | Regras de uso eficiente dos modelos AI |

## Referências e rastreabilidade (obrigatório)

- Toda a afirmação factual ou numérica (datas, preços, distâncias, vagas,
  prazos de inscrição) deve ter referência numerada inline
  (`<a href="#ref-n" class="ref">[n]</a>`) com entrada clicável na
  bibliografia (`<li id="ref-n"><a href="URL" …>Fonte — descrição</a></li>`),
  ou marcador explícito de estimativa.
- Numeração sequencial por página; nunca renumerar nem reutilizar ids.
- Fontes preferidas: oficiais e primárias (organizadores das provas,
  operadores, entidades oficiais) antes de agregadores ou blogs.
- Declarar incerteza no texto quando não há fonte primária suficiente.

## Eficiência de contexto (obrigatório para agentes)

- **Não ler ficheiros HTML inteiros**: localizar primeiro a secção relevante
  com grep e ler apenas esse intervalo.
- **Não lançar subagentes** salvo pedido explícito do utilizador.
- Não despejar conteúdo extenso de ficheiros na conversa; citar caminho e linhas.
- Regras completas: [docs/GOVERNANCE-AI-MODELS.md](docs/GOVERNANCE-AI-MODELS.md).

## Comportamento do agente

- `backup/` e `dumps/` são evidência — não editar nem apagar.
- Manter alterações pequenas e verificáveis; site é intencionalmente
  HTML/CSS/JS puro — não introduzir frameworks nem tooling.
