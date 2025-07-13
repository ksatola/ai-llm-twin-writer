# Start from the official Python image
FROM python:3.10
#FROM python:3.11-slim

# Arguments (parameter for environment settings)
ARG PYTHON_VER
ARG ENV_NAME

# Environment variables
ENV ENV_NAME=$ENV_NAME
ENV PYTHON_VER=$PYTHON_VER

# Copy files
RUN mkdir requirements
COPY requirements.txt requirements/
COPY install_dependencies.sh requirements/

# Install dependencies
RUN bash requirements/install_dependencies.sh $ENV_NAME $PYTHON_VER

# Set working directory
#WORKDIR /app

# Copy requirements if you have them
# COPY requirements.txt .
# RUN pip install --no-cache-dir -r requirements.txt

# Copy your application code
# COPY . .

# Set the default command
#CMD ["python"]