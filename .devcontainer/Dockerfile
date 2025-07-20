# Start from the official Python image
FROM python:3.11

# Change the shell to bash
SHELL ["/bin/bash", "-c"]

# Set environment variables
ENV HOME="/root" \
    DEBIAN_FRONTEND=noninteractive \
    PYENV_ROOT=$HOME/.pyenv \
    PATH=$HOME/.pyenv/bin:/root/.pyenv/shims:$PATH

# Install dependencies
RUN apt-get update && apt-get install --no-install-suggests --no-install-recommends --yes \
    git \
    curl \
    pipx \
    awscli \
    mc

# Install Google chrome in a docker container
# https://stackoverflow.com/questions/70955307/how-to-install-google-chrome-in-a-docker-container
RUN apt-get install -y wget
RUN wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt-get install -y ./google-chrome-stable_current_amd64.deb

# Install pyenv
RUN git clone --depth=1 https://github.com/pyenv/pyenv.git .pyenv
RUN pyenv install 3.11.8
RUN pyenv global 3.11.8
RUN pyenv rehash

# Copy files
#RUN mkdir for_docker
#COPY requirements.txt requirements/
#COPY install_dependencies.sh requirements/
#COPY pyproject.toml $HOME/
#COPY .devcontainer/.post-install.sh /tmp/.post-install.sh
#RUN bash /tmp/.post-install.sh

# Install poetry, poethepoet, and pre-commit
RUN pipx install poetry==1.8.3
RUN pipx ensurepath
ENV PATH="${PATH}:$HOME/.local/bin"
#RUN source $HOME/.local/bin && poetry update && poetry install
#RUN poetry self add 'poethepoet[poetry_plugin]'
#RUN poetry install --without aws
#RUN poetry run pre-commit install
#RUN poetry shell

#RUN source ~/.bashrc # refresh bash terminal
#RUN poetry shell
#RUN poetry install --without aws
#RUN poetry run pre-commit install
#RUN poetry self add 'poethepoet[poetry_plugin]'





# Install a specific Python version using pyenv
#ARG PYTHON_VERSION=3.11.8
#RUN pyenv install ${PYTHON_VERSION} && \
#    pyenv global ${PYTHON_VERSION}

# Install Poetry (latest version)
#RUN curl -sSL https://install.python-poetry.org | python3 -

# Add Poetry to PATH
#ENV PATH="/root/.local/bin:$PATH"

# Verify installation
#RUN python --version && poetry --version

# Create a working directory
#WORKDIR /app

# Copy your project files (if any)
# COPY . .

# Default command
#CMD ["bash"]
