# Unreal Engine 5.1 build scripts
Automatic build scripts for our Unreal Engine 5 indie gamedev team.
<br /><br />
Based on the Unreal Engine 4 Automation tool by botman99: https://github.com/botman99/ue4-unreal-automation-tool
<br /><br />
Useful for team workflow where BP programmers or designers work with a C++ unreal project through an editor only and don't compile it through MSBuild.
<br />
Currently in its minimal state where the only available script is `BuildEditor.bat` which builds the project in the same folder if the proper `.sln` file is present, but additional functionality is coming.
<br /><br />
Usage:
<br />
- Put `BuildEditor.bat` into the project's root folder, edit `PROJECT_NAME` to reflect the name of your project file (no extension)
- If you have UE installed in a non-standard directory (C:\Program Files\Epic Games\UE_5.1), edit `ENGINE_DIR` to reflect that
- Right-click on the `.uproject` file and select "Generate Visual Studio project files"
- Launch `BuildEditor.bat`
- Wait after it finishes compiling and if you don't see a `BUILD_EDITOR_FAILED.txt` file appear in the directory, the compilation was successful.
- Launch the editor through the project file
