from flask import Flask
from datetime import datetime as dt

app = Flask(__name__)

@app.route("/")
def root():
    return f"{dt.now()}\n"

@app.route("/a/b/c")
def a_b_c():
    return f"a/b/c: {dt.now()}\n"

if __name__ == "__main__":
    app.run()
