from flask import Flask
from redis import Redis

app = Flask(__name__)
redis = Redis(host='redis', port=6379)


@app.route('/')
def hello():
    redis.incr('hits')
    return 'This Url has been visted %s times.' % redis.get('hits').decode('utf8')


if __name__ == "__main__":
    app.run(host="0.0.0.0", debug=True)
