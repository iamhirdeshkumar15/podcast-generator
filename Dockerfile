FROM ubuntu:latest

# Update package list and install required packages
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3-dev

# Upgrade pip to the latest version
RUN pip3 install --upgrade pip

# Install PyYAML using pip
RUN pip3 install PyYAML

# Copy the feed.py script to /usr/bin and make it executable
COPY feed.py /usr/bin/feed.py
RUN chmod +x /usr/bin/feed.py

# Copy the entrypoint script and make it executable
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
