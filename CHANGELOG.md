# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [Unreleased]
### Changed
- Apply language settings to FZN and DZN files as well
- Use Iro generated syntax highlighting!

## [0.8.1] - 2018-01-24
### Fixed
- Added the forgotten `elseif` keyword

## [0.8.0] - 2017-11-17
### Removed
- Moved the linting functionality into a seperate package, [`linter-mzn`](https://github.com/Dekker1/linter-mzn). With eyes to the future and possibility for a full MiniZinc Suite in Atom.

## 0.7.0
### Changed
- Create seperate definitions for FlatZinc + Output models and DZN files.
### Fixed
- Fixes linting error when opening DZN files

## 0.6.1
### Changed
- Change the repository URL

## 0.6.0
### Changed
- Upgrade to Linter API v2

## 0.5.0
### Added
- The linter now indicates the right column if indicated by `mzn2fzn`

## 0.4.1
### Changed
- Enables the user to disable linting in the package settings
### Fixed
- Fixes problem in highlighting of numerical constants

## 0.4.0
### Added
- Combines the linter and syntax highlighting package (formerly https://github.com/jjdekker/linter-mzn). I'll look into the possibility of disabling the linter extension at a later stadium.

## 0.3.2
### Fixed
- Removes some duplicate syntax
- Fixes the highlighting of numerical constants

## 0.3.1
### Fixed
- Removes an tab in the `forall` snippet.

## 0.3.0
### Added
- Adds function colouring to all predicates documented in the 2.0 documentation.
- Adds indentation rules for parentheses
### Changed
- Removes newlines from snippets (just press enter, the indentation rules will do the rest)

## 0.2.0
### Added
- Adds snippets for basic MZN functionalities
- Adds snippets for possible solve statements

## 0.1.1
### Fixed
- Adds syntax highlighting for the `endif` keyword

## 0.1.0
### Added
- Basic syntax highlighting


[Unreleased]: https://github.com/Dekker1/linter-mzn/compare/v0.8.1...HEAD
[0.8.1]: https://github.com/Dekker1/linter-mzn/compare/v0.8.0...v0.8.1
[0.8.0]: https://github.com/Dekker1/linter-mzn/compare/v0.7.0...v0.8.0
