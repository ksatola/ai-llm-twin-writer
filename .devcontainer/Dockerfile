# Start from the official Python image
FROM python:3.10
#FROM python:3.11-slim

# Arguments (parameter for environment settings)
#ARG PYTHON_VER
#ARG ENV_NAME

# Environment variables
#ENV ENV_NAME=$ENV_NAME
#ENV PYTHON_VER=$PYTHON_VER




ENV HOME="/root"

WORKDIR $HOME

# Copy files
RUN mkdir requirements
COPY requirements.txt requirements/
COPY install_dependencies.sh requirements/
#COPY pyproject.toml requirements/


RUN apt-get update
RUN apt-get install -y \
    pipx \
    mc
RUN pipx ensurepath
#RUN pipx ensurepath --global # optional to allow pipx actions with --global argument

RUN apt-get install -y git
RUN git clone --depth=1 https://github.com/pyenv/pyenv.git .pyenv

ENV PYENV_ROOT="$HOME/.pyenv"
ENV PATH="$PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH"
RUN pyenv install 3.11.8
RUN pyenv global 3.11.8

RUN pipx install poetry==1.8.3
#RUN poetry env use 3.11
#RUN poetry self add 'poethepoet[poetry_plugin]'

# Install dependencies
RUN bash requirements/install_dependencies.sh $ENV_NAME $PYTHON_VER

# Install the Python packages
#RUN pip3 install -r requirements/requirements.txt

# Set working directory
#WORKDIR /app

# Copy requirements if you have them
# COPY requirements.txt .
# RUN pip install --no-cache-dir -r requirements.txt

# Copy your application code
# COPY . .

# Set the default command
#CMD ["python"]