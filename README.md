# About

This is a [single node rancher](https://rancher.com/docs/rancher/v2.x/en/installation/single-node/) server.

**WARNING THIS IS BROKEN DUE TO DNS INTEGRATION ISSUES. You should use [rgl/rancher-single-node-ubuntu-vagrant](https://github.com/rgl/rancher-single-node-ubuntu-vagrant) instead**

## Usage

Install the [debian-10-amd64](https://github.com/rgl/debian-vagrant) box.

Launch the environment:

```bash
vagrant up --provider=libvirt # or --provider=virtualbox
```

Add the environment hosts to your machine `hosts` file:

```plain
10.1.0.2 pandora.rancher.test
10.1.0.3 server.rancher.test
```

Access the rancher server at https://server.rancher.test:8443 and login with the default `admin` username and password.

The docker registry is at https://pandora.rancher.test:5000.

## References

* https://rancher.com/docs/rancher/v2.x/en/troubleshooting/kubernetes-components/
* https://github.com/rancher/quickstart
* https://github.com/rancher/api-spec
* https://kubernetes.io/docs/reference/kubectl/cheatsheet/
