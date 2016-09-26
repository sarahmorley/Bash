#!/bin/bash
# while loop to read each line in the file Students.txt
while read line;
	do
	# create an array from $line using delimiter space
	IFS=" " read -r -a studentArray <<< "$line"
	# created a variable to store studentid from the studentArray per student
	ID="${studentArray[0]}"
	# create a directory for each student based on $ID in output
	mkdir output/$ID
	# create file details.txt for current student 
	touch output/$ID/Details.txt
	# write current students details to the details text file
	echo "$line" >> output/$ID/Details.txt
	# find the current students results 
	# loop over the blocks in the input directory
	for block in input/*/; # 1st / denotes input as a directory, */ denotes all directories in it
		do
		# loop over the modules in the current block
		for module in $block*.txt;
			do
			# read through the data in each module.txt with a view to find current student
			while read moduleLine;
			do
			# create an array from $moduleline to match the current student to their result
			IFS=" " read -r -a resultArray <<< "$moduleLine"
			# if statement to find student
			if [ $ID = "${resultArray[0]}" ];	
			then
				# if we find the student write their results to their directory in files for each block
				#create a variable to hold the address for this students individual block results minus the directory name prefix and the / suffix
				blockName="${block#input/}"
				blockNameStripped="${blockName%/}"
				# create a variable to hold the module ID minus the .txt suffix and the directory prefix
				moduleName="${module%.txt}"
				moduleNameStripped="${moduleName#input/$blockNameStripped/}"
				echo $moduleNameStripped "${resultArray[1]}" >> output/$ID/$blockNameStripped.txt 	
				# create a variable to hold fail rate
				fail=40
				# check if current students results are less than fail
				if [ "${resultArray[1]}" -lt $fail ];
				then
					# if they are append failed plus the module id to a file named notes.txt
					echo "Failed $moduleNameStripped" >> output/$ID/notes.txt
				fi
			fi
			done < $module 
		done	
	done 
done < input/Students.txt




