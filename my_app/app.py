from flask import Flask, request, jsonify
from tasks import add

app = Flask(__name__)

@app.route('/add', methods=['POST'])
def add_numbers():
    data = request.get_json()
    x = data['x']
    y = data['y']

    result = add.delay(x, y)  # Асинхронно запускаем задачу Celery

    return jsonify({"task_id": result}), 202

if __name__ == '__main__':
    app.run(debug=True)
