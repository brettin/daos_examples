# SC22 tutorial
# https://github.com/NGIOproject/PMTutorial

# Create a container named Brettin0 on pool0
daos cont create -t POSIX -l Brettin0 pool0

# Creating a pool would be something an administrator does
# daos cont create my_pool --label=my_container --type=POSIX

# Mount container Brettin0 on /tmp/test
dfuse -m /tmp/test --pool=pool0 --container=Brettin0

# Enable interception library
# Good for checkpointing, for example. Not for small byte I/O
export LD_PRELOAD=/usr/lib64/libioil.so

# Do I/O on /tmp/test 

# Unmount the container
fusermount3 -u /tmp/test

# Delete the container
daos cont destroy pool0 Brettin0
