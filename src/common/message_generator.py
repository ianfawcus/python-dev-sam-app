import random

def get_message():
    message = "hello world"
    n = random.random()
    if n < 0.33:
        message = "Hola! Buenos dias"
    elif n < 0.66:
        message = "top of the morning to ya"
    return message

def get_moon_boy_quotes():
    message = "insane gains"
    n = random.random()
    if n < 0.33:
        message = "time to buy a lambo"
    elif n < 0.66:
        message = "check out my holdings"
    return message