Usage:

There are 3 parameters you will need to pass when spinning up new shells


`HOST`
* A hostname for the container

`PORT`
* Port that will be mapped to the host machine in order for external access

`PASS`
* A password for the container shell itself

Putting it all together!
```
make spinup PORT=2227 HOST=monkeyBox PASS=testing
```
