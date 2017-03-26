# Supported tags and respective `Dockerfile` links

-	[`1.14`, `latest` (*Dockerfile*)](https://github.com/butter/docker-tika/blob/93e533a89bcdfbab01d0625b6546b2fe5c1ce76c/Dockerfile)

# What is Tika?
Apache Tika is a content detection and analysis framework, written in Java, stewarded at the Apache Software Foundation. It detects and extracts metadata and text from over a thousand different file types, and as well as providing a Java library, has Server and Command Line editions suitable for use from other programming languages.

> [wikipedia.org/Apache_Tika](https://en.wikipedia.org/wiki/Apache_Tika)

![logo](https://upload.wikimedia.org/wikipedia/en/c/c5/Apache-Tika.png)

# How to use this image

## Create a `Dockerfile` in your Tika project

```dockerfile
FROM butter/tika-server:1.14
ENTRYPOINT java -jar /usr/local/bin/tika.jar -h 0.0.0.0 -c /tika-config.xml
```

# License

View license information for [Tika](https://www.apache.org/licenses/).
