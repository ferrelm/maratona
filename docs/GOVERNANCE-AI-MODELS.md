# Governance — Uso eficiente de modelos AI

Regras para usar bem as três ferramentas AI disponíveis no VSCode
(GitHub Copilot, Codex, Claude Code) e para não esgotar os limites do
plano Claude Pro. Aplicável a este repositório e reutilizável nos outros
projetos (`trail-running`, `spea`, etc.).

**Motivação (observado em 2026-06-12):** sessão de 5h do Claude Pro a 100%
com 88% do uso feito acima de 150k tokens de contexto — ou seja, a maior
parte do custo veio de sessões demasiado longas e com contexto inchado,
não do volume de trabalho em si.

## 1. Routing — que ferramenta para que tarefa

| Tarefa | Ferramenta | Porquê |
|---|---|---|
| Autocomplete, edições pequenas num ficheiro, boilerplate, renomes simples | **GitHub Copilot** | Quota separada do Claude; instantâneo; não gasta sessão Pro |
| Tarefa de código bem delimitada num só ficheiro/feature, iteração rápida | **Codex** | Quota separada; bom para escopo fechado |
| Alterações multi-ficheiro, pesquisa com referências, governance, planeamento, revisão | **Claude Code** | Onde o raciocínio e o contexto de repo compensam o custo |

Regra prática: **não usar o Claude Code para o que o Copilot inline resolve.**
Cada pergunta trivial numa sessão Claude longa custa o contexto inteiro outra vez.

## 2. Disciplina de contexto (o problema dos >150k)

- **Uma tarefa = uma sessão.** Usar `/clear` ao mudar de assunto; nunca
  reaproveitar uma sessão longa para uma tarefa nova "só porque já está aberta".
- **`/compact` a meio de tarefas longas**, em pontos de pausa naturais
  (depois de um commit, antes de mudar de fase).
- **Não pedir leituras integrais de ficheiros grandes.** As páginas deste
  repo têm 20–60 KB; pedir a secção relevante ("a tabela de custos em
  pt.html") em vez de "lê o pt.html todo".
- **Não colar dumps grandes no chat** (HTML inteiro, logs longos); indicar
  o caminho do ficheiro e deixar o agente ler só o necessário.
- **Evitar subagentes/agent teams** salvo pedido explícito — cada um
  re-deriva contexto do zero.
- **Manter o CLAUDE.md curto.** É carregado em todas as sessões; regras
  extensas vivem em docs/ e são lidas a pedido.

## 3. Escolha de modelo (plano Pro)

- Usar o **modelo por defeito (Sonnet)** para praticamente tudo neste
  repositório — é um site estático; nenhuma tarefa aqui justifica Opus.
- Reservar modelos maiores para planeamento/revisão pontual noutros
  projetos, e mesmo aí: planear com modelo grande, executar com Sonnet.
- Verificar o modelo ativo com `/model` no início de sessões importantes.

## 4. Higiene de sessão (janela de 5h)

- **Agrupar o trabalho AI em blocos** em vez de pedidos avulsos dispersos
  ao longo do dia — cada retoma de sessão longa repaga o contexto.
- Se a sessão Pro estiver perto do limite, **passar o resto do trabalho
  para Copilot/Codex** em vez de queimar a janela seguinte.
- Sessões paradas há horas: `/clear` e recomeçar com um pedido bem
  formulado é mais barato do que continuar um histórico gigante.

## 5. Pedidos bem formulados poupam quota

- Dar logo o contexto necessário no primeiro pedido (ficheiros, páginas
  afetado, fonte a citar) evita rondas de descoberta.
- Pedir **plano primeiro** em tarefas grandes (plan mode) e só depois
  execução — corrigir um plano custa muito menos que corrigir execução.
- Confirmar no fim de cada tarefa que não ficou trabalho pendente que
  obrigue a reabrir a sessão amanhã com o contexto todo outra vez.

---

_Documento criado em 2026-06-13. Rever quando o plano ou as ferramentas
disponíveis mudarem._
