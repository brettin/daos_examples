# create a container named Brettin0 on pool0
daos cont create -t POSIX -l Brettin0 pool0

# mount container Brettin0 on /tmp/test
dfuse -m /tmp/test --pool=pool0 --container=Brettin0

# Enable interception library
export LD_PRELOAD=/usr/lib64/libioil.so

# do I/O on /tmp/test 

# unmount the container
fusermount3 -u /tmp/test

# delete the container
daos cont destroy pool0 Brettin0
