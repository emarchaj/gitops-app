import os
import logging

from flask import Flask, jsonify

logging.basicConfig(level=logging.DEBUG)
app = Flask(__name__)


@app.route('/')
def hello():
    logging.info('Hello world endpoint hit')
    return 'Hello world!'


@app.route('/env')
def environ():
    result = {}
    for k, v in os.environ.items():
        result[k] = v
    return jsonify(result)


if __name__ == '__main__':
    app.run(debug=True)
