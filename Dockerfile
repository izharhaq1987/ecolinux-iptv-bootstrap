# Base Image
FROM python:3.12-slim

# Metadata
LABEL maintainer="Izhar Haq <github.com/izharhaq1987>"
LABEL description="Dockerized FastAPI IPTV loader for EcoLinux systems"

# Set working directory
WORKDIR /app

# Copy project files
COPY ./app ./app
COPY ./requirements.txt .
COPY ./run_dev.sh .
COPY ./test_data ./test_data
COPY ./services ./services
COPY ./scripts ./scripts

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Set environment variable for production (optional)
ENV PYTHONUNBUFFERED=1

# Expose port
EXPOSE 8000

# Default command to run the FastAPI app
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
