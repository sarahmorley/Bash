# Bash-Script

This is a college assignment brief. 

All input files will be contained in a folder named input
All output files must be stored to a folder named output, which will exist.

Results for module marks are contained in folders for each block (1-4)

Results take the form
<StudentID> <Mark>
For example:
1 89
2 90

and are contained in files named <modulecode>.txt
For example:
module1.txt

There is also a file named Students.txt containing:
<StudentID> <Surname> <name> <Birthdate> <Address>
on each line.
For example:
1 Smith John 01/01/1991 Dublin


You must produce student records for each student. These must be contained in a folder named <StudentID> (10%)



The student records must be made up of the following:

1. (30%) a file named Details.txt containing student details, in the form:
Surname: <Surname> 
Name: <name> 
Date of Birth: <Birthdate> 
Address: <Address>
For Example:
Surname: Smith
Name: John
Date of Birth: 01/01/1991
Address: 10 Fake Street

2. (30%) a file for each block containing results for that block, in the form:
<ModuleID> <Mark>
For Example:
module 67

3. (30%) a file named notes.txt, if applicable containing 
Failed:
<ModuleID> 
For Example:
Failed
module1
