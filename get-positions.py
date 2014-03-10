import sys
import json
import datetime
import requests
import time

def main():
    key = None
    while True:
        response = requests.get("http://m.cip.gatech.edu/api/buses/position")
        n = datetime.datetime.now()
        downloaded_at = datetime.datetime.strftime(n, "%a %b %d %H:%M:%S EDT %Y")
        res = json.loads(response.content)
        for val in res:
            val['downloaded_at'] = downloaded_at
            print json.dumps(val)
        response.close()

        time.sleep(50)

if __name__ == '__main__':
    main()
