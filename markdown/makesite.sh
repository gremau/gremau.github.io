#!/bin/bash

# This will convert each markdown file in this directory to 
# html using pandoc, then push them to the website

# Ftp info

# Use cv.markdown file and pandoc to create html and pdf versions.
# Put html copy in toplevel dir, pdf in publicfiles/
# Then remove the markdown
echo "updating cv"
pandoc cv.markdown -s -o ../cv_gmaurer.html
pandoc cv.markdown -o ../public/cv_gmaurer.pdf 

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
    # Link css file and custom template (in this directory) that omits the 
    # YAML header in the rendered HTML
    pandoc $i --css=https://greg.pronghorns.net/style.css -s -o $newfilename --template pronghorns_pandoc_template.html
    
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
