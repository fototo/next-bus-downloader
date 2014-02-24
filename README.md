Download scripts for next bus data
===================
These scripts poll [gatech next bus api](http://m.cip.gatech.edu/api/buses) for data and save them.

can run them on shuttle servers with nohup

# position
gets next bus current position and writes tsv to std out. redirect to save to file. 

results are here http://www.prism.gatech.edu/~pviolette3/positions.tsv

# route prediction
Writes precitions in a directory structure: $basedir/$busColor/$stop.tsv
$stop.tsv has the timestamp of the prediction, then a list of prediction times in minues from that timestamp, and then more
detailed information (in theory there's a jobID so we can match with positions but this is sometimes null).

Right now is hard coded to only do red route. the script is kind of slow. not sure if this is curl or their api as 
i'm not sure how to do bulk prediction requests.

results are here:
http://www.prism.gatech.edu/~pviolette3/buses/
