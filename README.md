# RepairZwiftFIT
Repair Zwift FIT file by merging with QZ Fitness FIT file to add Zwift location data

RepairZwiftFIT is currently a Windows 10/11 command-line and batch solution to resolve a problem with Zwift FIT files. That is, Zwift calculates elevation/altitude incorrectly for treadmill incline. Specifically, negative incline is assigned 0 elevation. QZ FIT files, when synced to Zwift activities, don’t contain Zwift's location data (virtual lat/long), but they do contain correct calculated elevation. Zmerge will merge Zwift FIT location data (and other important data fields) with QZ FIT data including calculated elevation.

Requirements:
- Requires Oracle Java™ Runtime Environment 8 - 1.8.0 or higher - https://www.java.com/en/download/
- Requires QZ Fitness app for Windows - https://github.com/cagnulein/qdomyos-zwift/wiki/. Note that iOS and Android versions of QZ Fitness are currently being tested and are not supported at this time.

RepairZwiftFIT can be run from Windows command-line or as a batch file.

Background:
- Zwift records a FIT file for each treadmill activity (manual run, workout, event, or meetup). Note that these FIT files contain incorrect elevation data for treadmill incline as described above.
- QZ Fitness records a FIT file whenever a workout is manually started and stopped. Its FIT file contains accurate workout metrics collected from a connected treadmill including correct elevation/altitude calculated from treadmill incline.

Usage:
- Within the installation folder, edit merge-fit.bat to set the FIT file location folders of both Zwift and QZ Fitness. By default, Zwift Windows stores its FIT files in %USERPROFILE%\Documents\Zwift\Activities. Currently, QZ Fitness for Windows is flexible and can be installed in any location.
- Complete a Zwift activity (manual run, workout, event, or meetup) and ensure QZ Fitness has recorded the activity in the background by starting and stopping the session.
- Run merge-fit.bat. The newest Zwift and QZ Fitness files will be located and merged. The resulting FIT file is exported to the /merged folder within the installation folder.
