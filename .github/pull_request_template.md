# Pull Request

## Description
<!-- Provide a brief description of what this PR does -->

## Type of Change
<!-- Mark the relevant option with an "x" -->
- [ ] 🐛 Bug fix (non-breaking change which fixes an issue)
- [ ] ✨ New feature (non-breaking change which adds functionality)
- [ ] 💥 Breaking change (fix or feature that would cause existing functionality to not work as expected)
- [ ] 📝 Documentation update
- [ ] 🔧 Maintenance (dependency updates, CI improvements, etc.)
- [ ] 🎨 Code style/formatting changes
- [ ] ♻️ Refactoring (no functional changes)

## Changes Made
<!-- Describe the changes you made in detail -->

-
-
-

## Related Issues
<!-- Link any related issues using "Fixes #123" or "Closes #123" -->
- Fixes #
- Related to #

## Testing
<!-- Describe how you tested your changes -->

### Test Environment

- [ ] Ubuntu (ubuntu-latest)
- [ ] macOS (macos-latest)
- [ ] Windows (windows-latest)
- [ ] Self-hosted runner

### Test Cases
<!-- Describe what you tested -->
- [ ] Basic installation works
- [ ] Version pinning works correctly
- [ ] Cross-platform compatibility
- [ ] Error handling works as expected
- [ ] Authentication works properly
- [ ] Prompt ingestion works (if applicable)

### Test Configuration
<!-- Share the workflow configuration you used for testing -->
```yaml
- name: Setup Amp CLI
  uses: ben-ranford/setup-ampcli-action@main  # or your branch
  with:
    version: latest
    # ... other test inputs
```

## Breaking Changes
<!-- If this is a breaking change, describe what users need to do to migrate -->
- [ ] This PR introduces breaking changes
- [ ] Migration guide has been updated

### Migration Required
<!-- If breaking changes, explain what users need to change -->

## Documentation

- [ ] README.md updated (if needed)
- [ ] Action inputs/outputs documented
- [ ] Examples updated (if needed)
- [ ] Changelog updated (if applicable)

## Checklist
<!-- Mark completed items with an "x" -->
- [ ] My code follows the project's style guidelines
- [ ] I have performed a self-review of my own code
- [ ] I have commented my code, particularly in hard-to-understand areas
- [ ] I have made corresponding changes to the documentation
- [ ] My changes generate no new warnings or errors
- [ ] I have tested this on multiple platforms (if applicable)
- [ ] I have verified that existing functionality still works
- [ ] I have updated the version number (if applicable)

## Additional Notes
<!-- Add any additional notes, screenshots, or context here -->

## Reviewer Notes
<!-- Any specific areas you'd like reviewers to focus on -->

- Please pay special attention to:
-
-

---

<!-- 
Thank you for contributing to setup-ampcli-action! 
Please ensure all items in the checklist are completed before requesting review.
-->