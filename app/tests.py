import json

from subprocess import run, CalledProcessError
from flask import jsonify, request, abort, Blueprint
from pymongo import MongoClient
from pymongo.errors import ServerSelectionTimeoutError

blueprint = Blueprint('bp', __name__)


@blueprint.route('/api/v1/test_mongo')
def test_mongo():
    host = request.args.get('host', None)
    port = request.args.get('port', None)

    if not (host and port):
        return abort(400, 'You must specify host and port')

    try:
        nport = int(port)
    except ValueError:
        return abort(400, 'Port must be a number')

    try:
        client = MongoClient(host=host, port=nport,
                             serverSelectionTimeoutMS=100)
        client.server_info()
    except ServerSelectionTimeoutError:
        abort(500, 'No connection to MongoDB')

    return 'true'


def handle_error(e):
    return 'false'
