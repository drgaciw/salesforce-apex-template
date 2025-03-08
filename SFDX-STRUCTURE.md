# Salesforce DX Project Structure

This document explains the standard directory structure used in Salesforce DX (SFDX) projects.

## Overview

The `force-app` directory structure follows Salesforce's source format requirements and is organized as follows:

```
force-app/
└── main/
    └── default/
        ├── aura/       # Aura (Lightning) components
        ├── classes/    # Apex classes
        ├── layouts/    # Page layouts
        ├── lwc/        # Lightning Web Components
        ├── objects/    # Custom & modified standard objects
        ├── permissionsets/ # Permission sets
        └── triggers/   # Apex triggers
```

## Directory Purposes

### Primary Directories

- `force-app/`: The default source directory specified in `sfdx-project.json`
- `main/`: Represents the main source path
- `default/`: Contains all metadata organized by type

### Metadata Type Directories

Each subdirectory under `default/` serves a specific purpose:

- `classes/`: Contains all Apex class files
- `triggers/`: Houses all Apex trigger files
- `aura/`: Contains Aura components (older Lightning framework)
- `lwc/`: Contains Lightning Web Components (modern web component framework)
- `objects/`: Stores object definitions and custom fields
- `layouts/`: Contains page layouts for objects
- `permissionsets/`: Stores permission set definitions

## Significance

This standardized structure is crucial for:

1. **Source Tracking**: Enables efficient tracking of metadata changes
2. **Version Control**: Facilitates better source code management
3. **Deployment Management**: Streamlines the deployment process
4. **Package Creation**: Supports package development and distribution
5. **Team Development**: Ensures consistent development practices across teams

## Auto-Generation

This structure is automatically created when you create a new Salesforce DX project using the command:

```bash
sfdx force:project:create --name your-project-name
```

## Best Practices

1. Maintain the standard directory structure for consistency
2. Keep related metadata components in their designated directories
3. Use version control to track changes
4. Follow naming conventions for each metadata type
5. Regularly update and maintain project dependencies