# Use the official Python 3.10 image as the base image
FROM python:3.10

# Set the working directory to /app
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install the required dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the source code into the container
COPY . .

# Expose port 8000 for the Flask app
EXPOSE 5000

# Use Gunicorn to run the Flask app
CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app"]
