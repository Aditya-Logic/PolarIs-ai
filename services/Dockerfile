# Generic Dockerfile for PolarIs AI Python microservices
# (forecast-service, optimizer-service, telemetry-service, anomaly-service)
#
# Built from the REPO ROOT as build context, e.g.:
#   docker build -f services/Dockerfile --build-arg SERVICE_DIR=forecast-service --build-arg SERVICE_PORT=8001 .

FROM python:3.11-slim

ARG SERVICE_DIR
ARG SERVICE_PORT=8000
ENV SERVICE_PORT=${SERVICE_PORT}
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# Install service-specific dependencies first (better layer caching)
COPY services/${SERVICE_DIR}/requirements.txt ./requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy just this service's code
COPY services/${SERVICE_DIR} .

EXPOSE ${SERVICE_PORT}

CMD uvicorn app.main:app --host 0.0.0.0 --port ${SERVICE_PORT}
