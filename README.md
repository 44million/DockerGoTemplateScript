# DGTS:
A short, simple script to generate a new Go project with a Docker container, and a GitHub workflow built in.

To quickly install copy and paste the following commands (without the `$`) into your terminal:

```
$ git clone https://github.com/QRX53/DockerGoTemplateScript/

$ cd DockerGoTemplateScript

$ chmod u+x CreateGoProject.sh

$ ./CreateGoProject.sh
```

The project will be generated with the name given during the creation process. It will put all of the Go source files into a `/src` folder. It will also generate a GitHub workflow which will attempt to build the project every time you commit the project to a GitHub repository, useful for seeing if your build is passing. The following build structure is an example of what will be generated:

```
project-name/
├── Dockerfile
├── go.mod
├── .github/
│   └── workflows/
│       └── main.yml
└── src/
    └── main.go
```

Once generated, the project is ready to be put on GitHub, and is easily distributable thanks to Docker. See [this repository](https://github.com/QRX53/cgp-github-test) for a live example.
