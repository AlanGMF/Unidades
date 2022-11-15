

from flask import Flask

app = Flask(__name__)

@app.route("/hola")
def index():
    return "Hola"


@app.route("/mundo")
def index():
    return "mundo"