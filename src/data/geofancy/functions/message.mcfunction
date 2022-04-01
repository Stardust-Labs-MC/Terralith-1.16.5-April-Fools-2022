from random import randint, random, shuffle
from ./funny import messages

def clrs():
    while True:
        yield '#{:06x}'.format(randint(0, 256**3)) 

def funny():
    shuffle(messages)
    for message, color in zip(messages, clrs()):
        color = '{"text": "", "color": "' + color + '"}'
        data modify storage geofancy:main msgs append value message
        data modify storage geofancy:main colors append value color
