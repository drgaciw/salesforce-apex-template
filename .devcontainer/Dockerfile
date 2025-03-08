FROM mcr.microsoft.com/devcontainers/javascript-node:18

# Install Salesforce CLI
RUN npm install --global @salesforce/cli

# Install additional packages
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    git \
    curl \
    jq \
    unzip \
    vim \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

# Set up shell history
RUN echo "export HISTFILE=/commandhistory/.bash_history" >> "/home/node/.bashrc" \
    && echo "export PROMPT_COMMAND='history -a'" >> "/home/node/.bashrc" \
    && mkdir -p /commandhistory \
    && touch /commandhistory/.bash_history \
    && chown -R node:node /commandhistory

# Set up sfdx aliases
RUN echo "alias sf='sf'" >> "/home/node/.bashrc" \
    && echo "alias sfdx='sf'" >> "/home/node/.bashrc"

# Set up workspace directory
WORKDIR /workspace