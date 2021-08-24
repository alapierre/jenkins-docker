# Jenkins Docker image based on official Jenkins LTS 

It adds some useful staff

- docker client
- vi 
- docker group and adds jenkins user to this group
- trivy (aquasecurity)

WARNING: you need tailor guid for group docker - guid must be the same as on a host, alternatively you can add jenkins to root group:

`sudo usermod -a -G root jenkins`

## Licence
 
This project is under Apache 2.0 licence, but be aware of other components licences.
