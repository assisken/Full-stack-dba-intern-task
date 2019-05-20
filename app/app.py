from flask import Flask

from tests import blueprint, handle_error

app = Flask(__name__)


@app.route('/api/v1/get_rabbit', methods=['GET'])
def get_rabbit():
    with open('scripts/install_rabbit.sh', 'r') as file:
        response = file.read()
    return response


@app.route('/api/v1/get_mongo', methods=['GET'])
def get_mongo():
    with open('scripts/install_mongo.sh', 'r') as file:
        response = file.read()
    return response


if __name__ == '__main__':
    app.register_blueprint(blueprint)
    app.register_error_handler(400, handle_error)
    app.register_error_handler(500, handle_error)
    app.run(debug=True, host='0.0.0.0', port=80)
