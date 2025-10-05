FROM python:3.10-slim

# Set working directory inside container
WORKDIR /app

# Copy requirements and install dependencies
COPY Weather-app-source-files/requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Copy the full source code
COPY Weather-app-source-files/ .

# Expose port
EXPOSE 5000

# Run the Flask app
CMD ["python", "app.py"]
