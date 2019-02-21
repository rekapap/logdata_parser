# Ruby Parser Tech Test

A simple Ruby LogData Parser

## Description
Write a ruby script that:
Receives a log as argument (webserver.log is provided)
Returns the following:
> list of webpages with most page views ordered

> list of webpages with most unique page views also ordered

## Design

- Parser - responsible parsing the file: creating a new `logdata handler`, and passing the records to it, returns `logdata handler`
- LogDataHandler - handles data: stores data, and returns data either total visits or unique visits
- LogDataFormatter - returns a formatted string from a list

## Structure
Folders:
- lib: implementation
- spec: tests
- fixtures: fixtures for testing
- doc: generated documentation
- coverage: generated test coverage files

## Documentation
1. Generate Documentation:
```bash
rdoc
```
2. Open the index.html in your browser:
```text
doc/index.html
```
## Installation
Install bundle:
```bash
bundle install
```

## How to use
1. From the project folder run:
```bash
ruby parser.rb fixtures/webserver.log
```

## How to run tests
In your project folder run this command from terminal:
```bash
rspec
```

## How to run linter
In your project folder run this command from terminal:
```bash
rubocop
```

## Test Coverage
```text
COVERAGE: 100.00% -- 118/118 lines in 7 files
```

## Linter
```text
Inspecting 10 files
..........

10 files inspected, no offenses detected
```

## Technologies
### Languages
- Ruby

### Testing framework
- Rspec
- Capybara (capybara/rspec used in feature tests)

### Linter
- Rubocop

### Test Coverage
- Simplecov
- Simplecov console

### Documentation
- RDoc
