#!/usr/bin/env python3

from flask import Flask, jsonify
from flask_cors import CORS

import os
import logging

# Create Flask application
app = Flask(__name__)

# Enable CORS (Cross-Origin Resource Sharing)
CORS(app)

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

# Root endpoint
@app.route("/")
def hello():
    logger.info("Root endpoint accessed")
    return jsonify(message="Hello, World!"), 200

# Application entry point
if __name__ == "__main__":
    host = os.getenv("FLASK_HOST", "0.0.0.0")
    port = int(os.getenv("FLASK_PORT", 5000))

    app.run(
        host=host,
        port=port,
        debug=True
    )


# Client Browser / API
#         |
#         v
# +-------------------+
# | GET / Request    |
# +-------------------+
#         |
#         v
# +-------------------+
# | Flask Router     |
# +-------------------+
#         |
#         v
# +-------------------+
# | hello() Function |
# +-------------------+
#         |
#         v
# +-------------------+
# | Log Access       |
# +-------------------+
#         |
#         v
# +-------------------+
# | Return JSON      |
# | "Hello, World!"  |
# +-------------------+
