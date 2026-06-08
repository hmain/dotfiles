# Test-Driven Development

All implementation MUST follow test-driven development (TDD):

1. **Write tests first** — Before implementing any feature, service, or function, write the failing tests that define the expected behavior.
2. **Red → Green → Refactor** — Follow the TDD cycle strictly:
   - Red: Write a failing test that describes the desired behavior
   - Green: Write the minimum code to make the test pass
   - Refactor: Clean up the code while keeping tests green
3. **Property tests before implementation** — For tasks with associated correctness properties, write the property-based tests BEFORE writing the implementation code.
4. **No untested code** — Every service, handler, and utility must have corresponding tests. Code without tests should not be committed.
5. **Run tests after each change** — Verify tests pass after every implementation step.
