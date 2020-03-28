#!/bin/sh
# The game of CD, MV and CP ! (no rm version)
# Experimental. This script will created and use only one additional folder.

# CLEANING
rm -rf ./ScriptGameCDMVCP 2> /dev/null

# --------------------------------------------------------------------------
mkdir ./ScriptGameCDMVCP
cd ./ScriptGameCDMVCP
sleep 2
mkdir folder1 folder2 folder3
sleep 2
touch file1 file2 file3
# Creation finished.

# Now, moving file1 to folder1
mv file1 folder1/
# Now, moving file2 to folder2
mv file2 folder2/
# Now, moving file3 to folder3
mv file3 folder3/

echo "Waiting 10 seconds, and showing the part of script that has moved theses files!"
printf '
# Now, moving file1 to folder1
mv file1 folder1/
# Now, moving file2 to folder2
mv file2 folder2/
# Now, moving file3 to folder3
mv file3 folder3/  \n
'
echo "CTRL+C to abort"
echo "Waiting..."
sleep 10 # Waiting 10 seconds to let you see the script.

# Now, renaming all "file*" by "data*" with mv command
mv ./folder1/file1 ./folder1/data1
mv ./folder2/file2 ./folder2/data2
mv ./folder3/file3 ./folder3/data3
echo "Done !"
ls -lR folder1 folder2 folder3 # Showing the work ! Using ls with Recursivity
sleep 10 # Always let the time to see the LS. Is very important to make the time easier.
echo "Showing the script !"
printf '
# Now, renaming all "file*" by "data*" with mv command
mv ./folder1/file1 ./folder1/data1
mv ./folder2/file2 ./folder2/data2
mv ./folder3/file3 ./folder3/data3
echo "Done !"
ls -R folder1 folder2 folder3 # Showing the work ! Using ls with Recursivity \n
'
# Now, copying all files. The objective is to get all data* into all folder*
cp ./folder1/data1 ./folder2
cp ./folder2/data2 ./folder1 # For each folders, we use two commands. and we separate with a line in commentaries
# -------------------------------------------------
cp ./folder3/data3 ./folder2
cp ./folder2/data2 ./folder3 # Doing the same thing
# -------------------------------------------------
cp ./folder1/data1 ./folder3
cp ./folder3/data3 ./folder1 # Doing the same thing another time
# -------------------------------------------------
# Showing the script :
echo "Now, you can see the script !"
printf '
# Now, copying all files. The objective is to get all data* into all folder*
cp ./folder1/data1 ./folder2
cp ./folder2/data2 ./folder1 # For each folders, we use two commands. and we separate with a line in commentaries
# -------------------------------------------------
cp ./folder3/data3 ./folder2
cp ./folder2/data2 ./folder3 # Doing the same thing
# -------------------------------------------------
cp ./folder1/data1 ./folder3
cp ./folder3/data3 ./folder1 # Doing the same thing another time
# ------------------------------------------------- \n
'

# after that, we have copied everything. Now, we will show the work.
ls -R folder1 folder2 folder3
sleep 10

echo "This script is a very simple script."
printf '
For learning, for exploring and for editing them as you want !
'

# after, the script will clean up by deleting the folder completely and recursively.
# Try to loop !

echo "This version let the folder intact. You can explore it."
echo "This script delete any old folder named exactly same. Be aware!"
echo "The LS :"
echo "`ls -laR ./`\n Listing done!"
echo "The file has been removed successfully!"
echo "script end."
