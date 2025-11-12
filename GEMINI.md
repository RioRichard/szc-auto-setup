# Project Overview

This project is a PowerShell-based auto-setup tool designed to assist users in configuring their new Windows PCs. It provides a command-line interface (CLI) to guide users through various setup tasks, including gathering system information, installing software, and setting up printers. The tool is structured modularly, with a main script (`main.ps1`) that orchestrates the workflow and imports individual feature modules from the `src/` directory.

# Building and Running

This PowerShell tool does not require a separate build process. To run the tool, open a PowerShell terminal, navigate to the project's root directory, and execute the `main.ps1` script:

```powershell
./main.ps1
```

# Development Conventions

The project adheres to a modular development approach. Each core functionality is encapsulated within its own PowerShell module (`.psm1` file) located in the `src/` directory. The `main.ps1` script acts as the entry point, responsible for importing these modules and presenting the main menu to the user. This structure promotes code organization, reusability, and maintainability.

The current modules include:
- `CliUi.psm1`: Manages the command-line user interface and main menu interactions.
- `GatherInformation.psm1`: Contains logic for collecting system and user-specific information.
- `SoftwareSetup.psm1`: Designed for automating software installations.
- `PrinterSetup.psm1`: Handles the configuration and setup of printers.
