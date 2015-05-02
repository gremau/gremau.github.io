# README

This directory contains files for  greg.pronghorns.net website

##Files

* `file.markdown` is the original markdown file for drafting the web page.
* 'style.css' is the stylesheet for all the pages

##Procedures

* To generate the `file.html` file, run

        pandoc index.markdown --css=http://greg.pronghorns.net/style.css -o index.html

        * .html files can then be pushed to github.

* This is automated for all the files by running the makesite.sh script

        ./makesite.sh

