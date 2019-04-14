from flask import Flask


app = Flask(__name__)
app.config['SECRET_KEY'] = '3acca6db4382ca88211cf21dd61b32c7'

from gotapp import routes
