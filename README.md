A simple Docker configuration that is used as a base for other
containers that will run Cucumber tests.

Basically, you'll want to fork this project and modify either of
the scripts in the bin folder so that it loads the gems, etc. that
you need for your project and then executes them on boot.

**Note** that this container has a preset Entrypoint (the script in 
bin/run_tests.sh ), so you will need to use something like

```bash
docker run -i [other options] --entrypoint /bin/bash -t mucumber
```

if you intend to use this container interactively.

Otherwise, you'll need to mount your Cucumber workspace at /cucumber/work.

Includes the following gems by default:
--------------------------------------
 - cucumber
 - parallel_cucumber
 - headless 
