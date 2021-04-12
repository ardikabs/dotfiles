# GIT Commit
A properly formed Git commit subject line should always be able to complete
the following sentence:<br>
```
    * If applied, this commit <will your subject line here>
```

## Structure:
```
<type>[optional scope]: <subject>

[optional body]

[optional footer(s]
```

### Type
Must be one of the following:
* ci - Changes to our CI configuration files and scripts (example scopes: GitLabCI, GitHub Actions, TravisCI, CircleCI)
* build - Changes that affect the build system or ternal dependencies
* chore - Changes that affect the build process or xiliary tool changes
* docs - Documentation only changes
* feat - A new feature
* fix - A bug fix
* perf - A code change that improves performance
* refactor - A code change that neither fixes a bug or ds a feature
* revert - Reverting things
* style - Changes that do not affect the meaning of the de (white-space, formatting, missing semi-colons, etc)
* test - Adding missing tests or correcting existing (stests

### Subject
The subject contains a succint description of the change:
* Use the imperative, present tense: "change" not "changed" nor "changes"
* No dot (.) at the end.

### Scope
* A scope may be provided to a commit’s type, to provide additional contextual information and is contained within parenthesis, e.g.<br>
`feat(parser): add ability to parse arrays.`

### Body
* Just as in the subject, use the imperative, present tense: **"change"** not "changed" nor "changes".
* The body should include the motivation for the change and contrast this with previous behavior.

### Footer
* BREAKING CHANGE: a commit that has a footer **BREAKING CHANGE:**,
* Or appends a **!** after the type/scope, introduces a breaking API change (correlating with MAJOR in Semantic Versioning).
* A BREAKING CHANGE can be part of commits of any type.

### Examples
Commit message with no body
```
docs: correct spelling of CHANGELOG
```
Commit message with scope
```
feat(lang): add polish language
```
Commit with breaking change footer
```
feat: allow provided config object to extend other configs

BREAKING CHANGE: `extends` key in config file is now used for extending other config files
```

Commit message with `!` to draw attention to breaking ange
```
refactor!: drop support for Node 6
```
Commit message with both ! and BREAKING CHANGE footer
```
refactor!: drop support for Node 6
BREAKING CHANGE: refactor to use JavaScript features not available in Node 6.
```
Commit message with multi-paragraph body and multiple oters
```
fix: correct minor typos in code

see the issue for details

on typos fixed.

Reviewed-by: Z
Refs #133
```

# Rules
The 7 rules of a great commit message
1. Separate subject from body with a blank line
2. Limit the subject line to 50 characters
3. Capitalize the subject line
4. Do not end the subject line with a period
5. Use the imperative mood in the subject line
6. Wrap the body at 72 characters
7. Use the body to explain what and why vs. how

# References
1. https://chris.beams.io/posts/git-commit/
2. https://dev.to/helderburato/tterns-for-writing-better-git-commit-messages-4ba0
3. https://www.conventionalcommits.org/en/v1.0.0/