CRUSH.md - Crush Rules Documentation

- Build/Lint/Test:
  - npm install; inspect package.json for scripts
  - run lint/typecheck/tests via npm run <script> or direct tool calls
  - single test: use test runner pattern (e.g., -t for Jest/Vitest)
  - ensure TypeScript compiles: npx tsc -p tsconfig.json

- Code Style:
  - Imports: group externals then internals; no unused; prefer named imports
  - Formatting: consistent indentation, newline at end
  - Types: explicit returns, avoid any where possible
  - Naming: clear nouns/verbs; camelCase vars; PascalCase types
  - Error handling: fail-fast; avoid silent catches; propagate errors

- Tests:
  - unit-first; mock IO; deterministic tests
  - describe/it naming; test edge cases; aim for good coverage

- Cursor/Copilot Rules:
  - Cursor rules: .cursor/rules and .cursorrules
  - Copilot: .github/copilot-instructions.md (reference)

- Workflow:
  - small, incremental changes; run local tests before PRs
  - update CRUSH.md when patterns emerge

- Quick-start:
  - verify available scripts; npm install; run lints/tests as needed
