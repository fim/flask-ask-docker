#!/usr/bin/env python
# -*- coding: utf-8 -*-
import logging
from random import randint
from flask import Flask, render_template
from flask_ask import Ask, statement, question, session

app = Flask(__name__)
ask = Ask(app, "/")
logging.getLogger("flask_ask").setLevel(logging.DEBUG)

@ask.launch
def welcome():
    return question("Welcome to the sample application. What can I do for you?")

@ask.intent("SampleIntent")
def sample():
    return statement(render_template("sometemplate"))

@ask.session_ended
def session_ended():
    return '', 200

if __name__ == '__main__':
    app.run(debug=True)
