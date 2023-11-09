The TimeDiff file takes values from (getvar "CDATE") and converts them into seconds. Supplying the file with two inputs will return the difference in seconds.In order for the the function to operate correctly, a value of 100 or larger must be supplied. This is because of how the months are handled within the function. 

Input:
CDATE format: yyyyMMdd.hhmmssssss
yyyy = year
MM = month
dd = day
hh = hour
mm = minute
ssssss = seconds as ss.ssss

Output type: REAL

Example:
: (setq time1 (getvar "CDATE"))
20231109.10583884
: (setq time2 (1+ time1))
20231110.10583884
: (timediff time1)
63868129118.83984
: (timediff time2)
63868215518.83984
: (timediff time2 time1)
86400.0
