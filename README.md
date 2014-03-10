Download scripts for next bus data
===================
These scripts poll [gatech next bus api](http://m.cip.gatech.edu/api/buses) for data and save them.

## running
can run them on shuttle servers with ```run.sh```

./run.sh


## running everything
The position downloader requires the requests library. The easiest way to install on shuttle servers is with virtualenv.

to set up virtualenv one time, run:
```
curl -O "https://bitbucket.org/ianb/virtualenv/raw/tip/virtualenv.py"
chmod +x virtualenv.py
./virtualenv.py --distribute env
source env/bin/activate
pip install -r requirements.txt
```

And jq, for command line json parsing

```
curl -O "http://stedolan.github.io/jq/download/linux64/jq"
chmod +x jq
```

then, you can run ```./run.sh``` and everything will run happily :)


## position
get-positios.py is the equivelent script but written in python.
It prints out each bus location, and marks the downloaded buses with a timestamp of when the script downloaded them. migrated to add the timestamp to json file easier.

*below is now "deprecated"*
gets next bus current position and writes tsv to std out. redirect to save to file. 

results are here http://www.prism.gatech.edu/~pviolette3/positions.tsv

## route prediction
Writes precitions in a directory structure: $basedir/$busColor/$stop.tsv
$stop.tsv has the timestamp of the prediction, then a list of prediction times in minues from that timestamp, and then more
detailed information (in theory there's a jobID so we can match with positions but this is sometimes null).

Right now is hard coded to only do red route. the script is kind of slow. not sure if this is curl or their api as 
i'm not sure how to do bulk prediction requests.

results are here:
http://www.prism.gatech.edu/~pviolette3/buses/
