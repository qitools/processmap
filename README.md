OpenCPU App: processmap
---------------------

Simple OpenCPU Application. 

To access online, R is not needed on your computer, browse to https://public.opencpu.org/ocpu/github/qitools/pareto/www/

To install in R on your computer:

    library(devtools)
    install_github("opencpu", "jeroenooms")
    install_github("processmap", "qitools")

    library(opencpu)
    opencpu$browse("library/processmap/www")

Use the same function using a local webserver on your computer:

    library(processmap)
    processmap()
    ?processmap

For more information about OpenCPU apps, see [opencpu.js](https://github.com/jeroenooms/opencpu.js#readme)
