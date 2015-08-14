# gremau.github.io

This directory contains files for the greg.pronghorns.net website

##Files

* `markdown/` directory contains original markdown files (`page.markdown`) for each web page.
* 'style.css' is the stylesheet for all the pages

##Procedures

* To generate the `page.html` file, run

        pandoc index.markdown --css=http://greg.pronghorns.net/style.css -o index.html

* `page.html` and markdown files can then be pushed to github.

* This is automated for all the files by running the makesite.sh script

        ./makesite.sh

