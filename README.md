# Salesforce Apex Development Container Template

This template provides a consistent, isolated development environment for Salesforce Apex development using VS Code's Remote - Containers extension.

## Features

- Salesforce CLI pre-installed
- Node.js 18 for LWC development
- Java 17 for Apex development
- Git for version control
- Comprehensive VS Code extensions for Salesforce development
- Persistent storage for Salesforce CLI data, configuration, and command history
- Cross-platform support with both Bash and PowerShell scripts

## Included Extensions

The development container includes the following VS Code extensions:

### Salesforce Development
- **Salesforce Extension Pack**: Comprehensive suite of tools for Salesforce development
- **Apex PMD**: Static code analysis for Apex
- **Apex Log Analyzer**: Advanced log file analysis
- **Salesforce Documenter**: Documentation generation for Apex classes

### Code Quality & Productivity
- **ESLint**: JavaScript/TypeScript linting
- **Prettier**: Code formatting
- **Code Spell Checker**: Spell checking for code and comments
- **GitLens**: Enhanced Git capabilities
- **XML**: XML validation and formatting

### Collaboration
- **GitHub Copilot**: AI code assistance
- **GitHub Pull Request**: GitHub PR integration

## Getting Started

### Prerequisites

1. Install [Docker](https://www.docker.com/products/docker-desktop)
2. Install [VS Code](https://code.visualstudio.com/)
3. Install the [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extension in VS Code

### Using This Template

1. Create a new repository using this template or copy the `.devcontainer` directory to your existing Salesforce project
2. Open the project in VS Code
3. When prompted, click "Reopen in Container" or use the command palette (F1) and select "Remote-Containers: Reopen in Container"
4. Wait for the container to build and initialize

### Authentication

After the container is running, you'll need to authenticate with your Salesforce org:

```bash
# Authenticate with a Dev Hub org
sf org login web --set-default-dev-hub

# Create a scratch org (if needed)
sf org create scratch --definition-file config/project-scratch-def.json --set-default --alias my-scratch-org

# Push source to the scratch org
sf project deploy start
```

## Helper Scripts

The development container includes several helper scripts to streamline your workflow:

- `post-create.sh`: Runs automatically when the container is created to set up the development environment
- `setup-vscode.sh`: Configures VS Code settings for Salesforce development
- `setup-sfdx.sh`: Sets up Salesforce CLI configuration
- `test-connection.sh`: Tests your connection to Salesforce

You can run the test connection script at any time with:

```bash
sh .devcontainer/test-connection.sh
```

## Windows PowerShell Scripts

For Windows users, PowerShell versions of the helper scripts are also provided:

- `post-create.ps1`: Sets up the development environment on Windows
- `setup-vscode.ps1`: Configures VS Code settings on Windows
- `setup-sfdx.ps1`: Sets up Salesforce CLI configuration on Windows
- `test-connection.ps1`: Tests your connection to Salesforce on Windows

You can run these scripts in PowerShell before using the container to set up your local environment:

```powershell
# Run from the project root directory
.\.devcontainer\post-create.ps1

# Or run individual scripts
.\.devcontainer\test-connection.ps1
```

## Code Quality Tools

The container includes Apex PMD for static code analysis with a comprehensive ruleset:

- Best practices for Apex development
- Code style and naming conventions
- Design principles and complexity metrics
- Error prevention techniques
- Performance optimization rules
- Security vulnerability detection

The ruleset is automatically copied to your workspace and configured in VS Code settings.

## Customization

You can customize this development container by:

1. Modifying the `Dockerfile` to add additional tools or dependencies
2. Updating `devcontainer.json` to change container settings or add extensions
3. Customizing the `apex-ruleset.xml` file to adjust code quality rules
4. Editing `post-create.sh` to run additional setup commands
5. Creating a `.env` file based on the `.env.sample` template to set environment variables

## Troubleshooting

If you encounter issues:

1. Rebuild the container: Command Palette > "Remote-Containers: Rebuild Container"
2. Check Docker logs: `docker logs <container_id>`
3. Verify your Salesforce authentication: `sf org list`
4. Run the test connection script: `sh .devcontainer/test-connection.sh` (or `.\.devcontainer\test-connection.ps1` on Windows)
5. For Apex PMD issues, check that the ruleset file is correctly located at `.vscode/apex-ruleset.xml`

## License

This template is available under the MIT License. See the LICENSE file for more information.