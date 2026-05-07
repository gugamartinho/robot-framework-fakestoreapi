# Load environment variables from .env file.
# This file contains configuration used by Robot Framework tests.
from dotenv import load_dotenv
import os

load_dotenv()

# Base API URL for FakeStoreAPI calls.
BASE_URL = os.getenv("BASE_URL")

# Default JSON headers for API requests.
HEADERS_JSON = {
    "Content-Type": "application/json"
}

# Valid user credentials loaded from environment variables.
VALID_USER = {
    "username": os.getenv("API_USERNAME"),
    "password": os.getenv("API_PASSWORD")
}
