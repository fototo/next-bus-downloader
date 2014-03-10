import sys
import json
import datetime
import requests

def main():
    key = None
    for line in sys.stdin:
        toks = line.strip().split("\t")
        if not key:
            key = toks 
            key[key.index('date')] = 'downloaded_at'
            print key
        else:
            res = {}
            for i, item in enumerate(toks):
                res[key[i]] = item
            print json.dumps(res)

if __name__ == '__main__':
    main()
