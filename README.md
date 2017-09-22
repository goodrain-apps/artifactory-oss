# Artifactory-oss for [ACP](https://www.goodrain.com/ACP.html)



> JFrog Artifactory is the only Universal Repository Manager supporting all major packaging formats, build tools and CI servers.

![phpMyAdmin](http://goodrain-pkg.oss-cn-shanghai.aliyuncs.com/static/logo/Artifactory_hub_logo.png)



# Supported tags and Dockerfile links

`5.4.6` , `latest` [Dockerfile](https://github.com/goodrain-apps/artifactory-oss/blob/5.4.6/Dockerfile)

`5.3.2` [Dockerfile](https://github.com/goodrain-apps/artifactory-oss/blob/5.3.2/Dockerfile)

`5.3.0` [Dockerfile](https://github.com/goodrain-apps/artifactory-oss/blob/5.3.0/Dockerfile)

# About this image

This images base alpine system ,can be installed in Goodrain [ACM](https://www.goodrain.com/ACM.html). Fully compatible with the Goodrain [ACP](https://www.goodrain.com/ACP.html) platform.

# How to use this image

## Via ACM install

[![deploy to ACP](http://ojfzu47n9.bkt.clouddn.com/20170603149649013919973.png)](http://app.goodrain.com/detail/146/)



## Via docker

### Installation

Automated builds of the image are available on [hub.docker.com](https://hub.docker.com/r/goodrainapps/artifactory-oss/) and is the recommended method of installation.

```bash
docker pull goodrainapps/artifactory-oss
```

Alternately you can build the image yourself.

```bash
git clone https://github.com/goodrain-apps/artifactory-oss.git
cd artifactory-oss
make
```

### Quick Start

```bash
docker run -d --name artifactory \
-v $PWD/data:/var/opt/jfrog/artifactory
-p 8081:8081
goodrainapps/artifactory-oss
```

### Default User
Default Admin UserName: `admin` with password is `password` . In the production environment need to modify the admin password the first time.

# Environment variables

| Name       | Default   | Comments                                 |
| ---------- | --------- | ---------------------------------------- |
| DEBUG      | null      | docker-entrypoint.sh debug switch        |
| PAUSE      | null      | docker-entrypoint.sh pause for debug     |
