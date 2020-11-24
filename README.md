# Open-Collector on Windows

Simple project to allow you to run the LogRhythm Open Collector on Windows via Docker Desktop, this is not a supported way of running Open Collector, but theres no logical reason it shouldn't work with a bit of love and attention.

## Installation

Install Docker on Windows using the Standard Docker Desktop installer, be sure to use Hyper-V mode instead of WSL2 if asked, next simply run this project with:

`docker run -it --rm -v //var/run/docker.sock:/var/run/docker.sock binkhq/opencollector-on-windows {args}`

**Examples:**

```shell
$ docker run -it --rm -v //var/run/docker.sock:/var/run/docker.sock binkhq/opencollector-on-windows metrics start
$ docker run -it --rm -v //var/run/docker.sock:/var/run/docker.sock binkhq/opencollector-on-windows open-collector start
```

Docker will start a centos container (required for Open Collector install script) that maps back to the Docker Desktop Hyper-V Virtual Machine running 'real' Docker via the Docker Socket mounted in `/var/run/docker.sock`.

**NOTE:** When connecting back to a service running on the 'host' such as LogRhythm System Monitor you'll need to specify the network interface address of the Host and not use loopback, as in the Docker context this is the Hyper-V VM, not your 'real' localhost. Exmaple:

```
PS C:\> ipconfig

Windows IP Configuration


Ethernet adapter Ethernet:

   Connection-specific DNS Suffix  . : uxivznvq0eyezhzndfqyxhv0ve.zx.internal.cloudapp.net
   IPv4 Address. . . . . . . . . . . : 192.168.0.4 <-- This one
   Subnet Mask . . . . . . . . . . . : 255.255.255.0
   Default Gateway . . . . . . . . . : 192.168.0.1
PS C:\Users\laadmin>
```

## Other Notes

Pull requests welcome, no support provided by Bink and no promises anything works. #ItWorksOnMyMachine
