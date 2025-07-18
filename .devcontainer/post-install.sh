#!/bin/bash

# Using this script as all files are linked to the Docker container by Dev Container

# Poetry setup
poetry self add 'poethepoet[poetry_plugin]'
poetry install --without aws
poetry run pre-commit install
poetry shell







#CONDA_ENV=$1
#PYTHON_VER=$2
#CPU=$(uname -m) # Get the CPU architecture


# Poetry, Poe the Poet, and Pre-commit
#sudo apt install python3-poetry
#poetry shell
#poetry install --without aws
#poetry run pre-commit install
#poetry self add 'poethepoet[poetry_plugin]'


# AWS CLI
# https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
#yum remove awscli
#curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
#unzip awscliv2.zip
#./aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli --update --silent
