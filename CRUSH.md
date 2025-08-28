CRUSH.md - Crush Rules (AI-driven code tasks)

- Build/Lint/Test:
  - Install deps: npm install
  - Lint: npm run lint || echo 'no lint script'; or run eslint directly if configured
  - Type-check: npm run typecheck or tsc -p tsconfig.json
  - Tests: npm test; single test: npm test -- -t <testName> (Jest/Vitest)

- Code Style:
  - Imports: group external then internal; remove unused imports; prefer named imports
  - Formatting: consistent indentation; enforce existing project style (spaces, newline at end)
  - Types: TypeScript types, explicit returns, avoid any
  - Naming: clear verbs/nouns; camelCase vars; PascalCase types/classes
  - Error handling: fail-fast; meaningful messages; do not swallow errors

- Tests:
  - Focus on unit tests; mock IO; deterministic results
  - Test naming: describe/it style describing behavior
  - Coverage: target critical paths; add edge-case tests
  - Single test run flags: use -t/--testNamePattern (Jest) or -k (pytest) where applicable

- Cursor/Copilot Rules:
  - Cursor rules: .cursor/rules and .cursorrules
  - Copilot: .github/copilot-instructions.md (link/notes)

- Validation & Maintenance:
  - Run lint/typecheck/tests before PRs
  - Update CRUSH.md when new patterns emerge
