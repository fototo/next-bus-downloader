import json
import sys

def convert(fileIn, fileOut):
    result = []
    with open(fileIn) as f:
        for line in f:
            toks = line.split("\t")
            predList = json.loads(toks[2])
            for pred in predList:
                pred['created'] = toks[0]
                result.append(json.dumps(pred))
    with open(fileOut, 'w') as f:
        for line in result:
            print >>f, line

if __name__ == '__main__':
    convert(sys.argv[1], sys.argv[2])
