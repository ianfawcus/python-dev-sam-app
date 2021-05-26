import random

def get_message():
    message = "hello world"
    n = random.random()
    if n < 0.33:
        message = "word up sucka"
    elif n < 0.66:
        message = "top of the morning to ya"
    return message