# DockerGoTemplateScript
A short, simple script to generate a new Go project with a Docker container built in.

To quickly install copy and paste the following commands (without the `$`) into your terminal:

```
$ git clone https://github.com/QRX53/DockerGoTemplateScript/ 
$ cd DockerGoTemplateScript
$ chmod u+x CreateGoProject.sh
$ ./CreateGoProject.sh
```

To run, download the file, or copy and paste the contents into a new file called `CreateGoProject.sh`. Then, run `chmod u+x CreateGoProject.sh`. Now you're all set to run the project. Simply run `./CreateGoProject` in your chosen terminal, and follow the on screen instructions. Once successfully created, it will generate the following file structure:

```
.
└── your-project-name/
    ├── Dockerfile
    ├── go.mod
    └── /src/
        └── main.go
```
