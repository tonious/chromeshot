## Using headless Chrome as an automated screenshot tool... in Docker!

This is a docker image that wraps headless Chrome, as well as
[chrome-headless-screenshots](https://github.com/schnerd/chrome-headless-screenshots)
for cross platform relatively hi-fidelity screenshots of web pages.

This is _not_ a lightweight method of taking a screenshot.

### Building the docker image:

```sh
docker build -t tonious/chromeshot .
```

### Using the docker image:

```sh
docker run --rm -it --security-opt seccomp=~/seccomp/chrome.json -v $(pwd):/output tonious/chromeshot --url="https://github.com/tonious/" --full --delay=3000 --output=/output/output.png
```

The output path of the screenshot is inside the docker container.  If you would like that image to be saved outside of the container, you need to mount it as a volume.

Also, to run Chrome cleanly, you must either give the container `--cap-add=SYS_ADMIN` (not good) or a valid seccomp profile (better).

### Using the bash script.

`chromeshot.sh` hides some of the complexity of running the docker container:

  * It passes in a seccomp configuration.
  * It mounts the appropriate target directory into the vm.

```
usage: ./chromeshot.sh [ -d DELAY ] [ -o OUTFILE ] [ -x WIDTH ] [ -y HEIGHT ] URL

Take a screenshot of a website using headless Chrome and docker.
```

### Dockerizing Chrome

- [Chrome seccomp profile](https://raw.githubusercontent.com/jfrazelle/dotfiles/master/etc/docker/seccomp/chrome.json) by [Jessie Frazelle](https://github.com/jessfraz).
- [Headless Chrome Dockerfile](https://github.com/justinribeiro/dockerfiles/blob/master/chrome-headless/Dockerfile) by [Justin Ribeiro](https://github.com/justinribeiro).

### Headless Chrome

- [Using headless Chrome as an automated screenshot tool](https://github.com/schnerd/chrome-headless-screenshots) by [David Schnurr](https://github.com/schner://github.com/schnerd).  Also as a [medium article](https://medium.com/@dschnr/using-headless-chrome-as-an-automated-screenshot-tool-4b07dffba79a).
- [Getting Started with Headless Chrome](https://developers.google.com/web/updates/2017/04/headless-chrome#screenshots)
- [Headless Chromium](https://chromium.googlesource.com/chromium/src/+/lkgr/headless/README.md)
- [Chrome Debugging Protocol Viewer](https://chromedevtools.github.io/debugger-protocol-viewer/tot/)
