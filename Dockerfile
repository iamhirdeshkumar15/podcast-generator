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

# Install PyYAML using pip without upgrading pip
RUN python3 -m pip install pyYAML


# Copy the feed.py script to /usr/bin and make it executable
COPY feed.py /usr/bin/feed.py
RUN chmod +x /usr/bin/feed.py

# Copy the entrypoint script and make it executable
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
