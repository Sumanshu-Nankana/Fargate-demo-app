from flask import Flask

app = Flask(__name__)


@app.route("/")
def index():
    return "<h3>This is Demo Application Running on Fargate Container</h3>"


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)