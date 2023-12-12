# Windows Batch Scripts

This repository holds a few helper scripts to use in Windows Operation System

## Usage:

Clone this repository using the follow command:

```
git clone https://github.com/BestCodeTools/windows-batch-scripts.git
```

Or download it from Github directly, and extract the contents somewhere

Copy the path with the scripts, i.e: C:\dev\cmd-scripts

Open Environment Variables window

  Here's how you can open the Environment Variables screen on Windows 7, 10, and 11:

  Windows 7:

  Click on the Start button and right-click on Computer.
  Select Properties from the context menu.
  Click on Advanced system settings.
  In the System Properties window that opens, click on the Environment Variables button.
  Windows 10:

  Right-click on the Start button and click on System.
  Click on About, then click on System info.
  In the System Properties window that opens, click on Advanced system settings.
  Click on the Environment Variables button.
  Windows 11:

  Right-click on the Start button and select System.
  Click on Advanced system settings on the right side.
  In the System Properties window that opens, click on Environment Variables.

  Or you can just use WIN+R to open the Run dialog, type SystemPropertiesAdvanced and press ENTER, the System Properties should show up, then click Environment Variables button.

Find the PATH variable and double-click it to change it.

Add the path you just copied, i.e: c:\dev\cmd-scripts
Then press ENTER

## Create Branch command:

```shell
create-branch [source_branch/tag] [target_branch_name]
```

It deletes existing local source branch or tag, then fetches changes, then switch to the source branch or tag, then it creates target_branch_name from it

If tortoisegit is available, it asks if you want to open current folder with tortoisegit log command, once you close tortoisegit log window it asks if you want to push changes

NOTE: pushed changes will use the --no-verify flag

## Diff This command:

This command runs the tortoisegitproc executable with a couple of parameters.

The /command:diff parameter tells it to show the differences between the working copy and the repository.

The /path:%CD% parameter specifies the path to the working copy.

%CD% is a variable that contains the current directory, so this command will show the differences for the current directory

```shell
diff-this
```


## Git Log This command:

This command runs the tortoisegitproc executable with a couple of parameters.

The /command:log parameter tells tortoisegitproc to display the log of commits. The log shows the history of commits in reverse chronological order, which can be useful for understanding the evolution of a project. You can cherry-pick commits from it.

The /path:%CD%%1 parameter specifies the path for which to display the log. %CD% is a variable that contains the current directory, and %1 is a variable that contains the first command-line argument passed to the script. So, if you run the script with a command like git-log-this.bat /myfolder, it will display the log for the /myfolder directory within the current directory. If no argument is provided, it will display the log for the current directory.

```shell
git-log-this [/path-relative/to/current/directory]
```

## Create VS Code Extension command:
This command uses npx, a package runner tool that comes with npm, the Node.js package manager. The -p option is used to specify a package that npx should install and add to the PATH before executing the command. In this case, two packages are specified: yo and generator-code. yo is Yeoman, a scaffolding tool for modern web apps, and generator-code is a Yeoman generator for Visual Studio Code extensions. After these packages are installed, yo code is run to scaffold a new Visual Studio Code extension.

```shell
create-vscode-extension
```