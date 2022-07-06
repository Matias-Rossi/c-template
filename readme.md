# C Project template

> Template for simple C projects

## Quickstart

1. Clone the repository
2. Set required libraries and custom directories in the makefile
3. Change programName in .vscode/launch.json

## Features

- Makefile
- Unit testing using [CSpec](https://github.com/mumuki/cspec)
- VSCode debugging support

### Makefile features

- `all`: builds binaries with debugging support
- `release`: builds binaries without debugging support
- `clean`: cleans all binaries
- `submit`: creates a zip with the currently existing binary
- `test`: runs CSpec tests
