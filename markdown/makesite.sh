#!/bin/bash

# This will convert each markdown file in this directory to 
# html using pandoc, then push them to the website

# Ftp info

# Make a copy of the master cv file and pandoc to html and pdf.
# Put html copy in toplevel dir, pdf in publicfiles/
# Then remove the markdown
cp /home/greg/data/jobs/cv_master.markdown ./cv_gmaurer.markdown
echo "updating cv"
pandoc cv_gmaurer.markdown -s -o ../cv_gmaurer.html
pandoc cv_gmaurer.markdown -o ../publicfiles/cv_gmaurer.pdf 
rm cv_gmaurer.markdown

# Loop through each markdown file and make the html
for i in *.markdown
do 
    # Get filename and remove extension
    filename=$(basename "$i")   
    filename="${filename%.*}"
    # Make new path and extension and join into new filename
    newpath="../"
    extension=".html"
    newfilename=$newpath$filename$extension
    # Run with pandoc
    echo "processing $i to $newfilename with pandoc"
    pandoc $i -s --css=https://greg.pronghorns.net/style.css -o $newfilename
    
done

# Now commit and push all the html files to github

#git add *.html *.markdown
#git push

# The old way was to use curl
# for i in *.html
# do
#     echo "Sending to $HOST with curl"
#     curl -T $i ftp://$USER:$PASSWD@$HOST/
# done

# echo "Sending to pdf cv with curl"
# curl -T cv_gmaurer.pdf ftp://$USER:$PASSWD@$HOST/publicfiles/
