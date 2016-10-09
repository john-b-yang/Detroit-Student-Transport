__author__ = 'Harshita'

# import pickle
# from bs4 import BeautifulSoup
# from StringIO import StringIO
# import pycurl
# import re
# from aenum import Enum

# test firebase post 


import json, requests, pprint

url = 'http://ddot-beta.herokuapp.com/api/api/where/stops-for-route/DDOT_6419.json?key=MHACKS8'

# params = dict(
#     origin='Chicago,IL',
#     destination='Los+Angeles,CA',
#     waypoints='Joplin,MO|Oklahoma+City,OK',
#     sensor='false'
# )

data = requests.get(url=url)
binary = data.content
output = json.loads(binary)

for stop in output['data']['references']['stops']:
    print stop['id']

# when they enter in their starting stop, pull up all lines that leave from there
stopID = "DDOT_6419"
url = "http://ddot-beta.herokuapp.com/api/api/where/stop/%s.json?key=MHACKS8" % stopID

stopdata = requests.get(url=url)
stopbinary = stopdata.content
stopoutput = json.loads(stopbinary)
for route in stopoutput['data']['references']['routes']:
    print route

print "done"