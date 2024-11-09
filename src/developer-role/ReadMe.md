# How to Build an Experiment from the VSCode Desktop Extension
To build an experiment from the VSCode Desktop Extension, please follow the instructions in the [VSCode Extension Documentation](https://github.com/virtual-labs/tool-vscode-plugin/blob/main/README.md)

# How to Build an Experiment from the Command Line
**Required repositories -**
- The experiment repository
- ph3-lab-mgmt

1. Clone the experiment’s specific repository from [Github](https://github.com/virtual-labs/). For this example, let’s use [exp-adder-circuit-iiith](https://github.com/virtual-labs/exp-adder-circuit-iiith)
2. Clone the [ph3-lab-mgmt](https://github.com/virtual-labs/ph3-lab-mgmt) repository
   - Ensure both repositories are in the same working directory (e.g. *bug-test* ):
   - The folder placement should be
		```bash
		bug-test ----- exp-adder-circuit-iiith
			|----- ph3-lab-mgmt
		```
3. Open the *bug-test* folder in Visual Studio Code (VSCode).
4. Open the terminal within VSCode, ensuring your working directory is *bug-test* .
5. Navigate to the *ph3-lab-mgmt* folder:
		```bash
			cd ph3-lab-mgmt/
		```
    - In *ph3-lab-mgmt* , *main.js* contains commands for validation, build, and other command-line operations.
    - Locate the desired command in *main.js* , then copy and paste it into the command line, adjusting the path to include the experiment’s folder if needed.
    - If you encounter errors, install the required packages and dependencies until the command executes successfully.
6. If you don’t have the Live Server extension, install it in VSCode. Run Live Server to check for and reproduce the bug.

# How to Test and Fix Bugs for the Bug Reporting Tool
**Repository name -** *svc-bug-report*

1. Clone the experiment’s specific repository from [Github.](https://github.com/virtual-labs/)
2. Build the experiment files using the VSCode extension, preferably on the desktop version. If it doesn’t work, try building from the command line as explained above.
3. Once the bug is reproduced, clone the [*svc-bug-report*](https://github.com/virtual-labs/svc-bug-report) repository from GitHub.
	- Copy *svc-bug-report* folder into the experiment’s *build* folder at the following path:
		```bash
		bug-test/exp-adder-circuit-iiith/build/plugins/
		```
	- Open the corresponding HTML file for the bug in the *build* folder. Update the path for *bug-report.js* near the end of the HTML file.
	   - Example: In *bug-test/exp-adder-circuit-iiith/build/assignment.html* , locate the line with the bug-report.js script:	   	
			```bash
			<script type="module" src="https://virtual-labs.github.io/svc-bug-report/client/src/bug-report.js"> </script>
			```
	   - Change the path to point to the local folder:
			```bash
			<script type="module" src="plugins/svc-bug-report/client/src/bug-report.js"> </script>
			```
4. Test the bug fix by using console logging or other debugging methods as needed.

### Important Reminder
If you execute commands like *clean build* from the command line, it will delete your entire *build* directory. To avoid losing important changes, create regular backups of your modified files outside of the build directory.