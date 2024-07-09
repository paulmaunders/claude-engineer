FROM python:3.9

WORKDIR /app

# Copy requirements and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application files
COPY main.py .
COPY .env .
COPY entrypoint.sh .

# Create workspace and set permissions
RUN mkdir workspace && \
    chown -R 1000:1000 /app && \
    chmod +x entrypoint.sh

# Set environment variables for color support
ENV TERM=xterm-256color
ENV PYTHONIOENCODING=UTF-8
ENV PYTHONUNBUFFERED=1

# Switch to non-root user
USER 1000:1000

# Set the entrypoint
ENTRYPOINT ["/bin/bash", "/app/entrypoint.sh"]