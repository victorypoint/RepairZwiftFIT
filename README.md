# RepairZwiftFIT
Repair Zwift Run FIT files by merging with QZ Fitness FIT file to add Zwift location data

RepairZwiftFIT is a Windows batch solution to resolve a problem with Zwift Run FIT files. That is, Zwift calculates elevation/altitude incorrectly for treadmill incline; negative incline is assigned 0 elevation. QZ FIT files, when synced to Zwift activities, don’t contain Zwift's location data (virtual lat/long), but they do contain correct calculated elevation. RepairZwiftFIT will merge Zwift FIT location data (and other important data fields) with QZ FIT data including calculated elevation.

Requirements:
- Requires Oracle Java™ Runtime Environment 8 - 1.8.0 or higher - https://www.java.com/en/download/
- Requires QZ Fitness app for Windows - https://github.com/cagnulein/qdomyos-zwift/wiki/. Note that iOS and Android versions of QZ Fitness are currently being tested and are not supported at this time.

Background:
- Zwift records a FIT file for each treadmill activity (manual run, workout, event, or meetup). Note that these FIT files contain incorrect elevation data for treadmill incline as described above.
- QZ Fitness records a FIT file whenever a workout is manually started and stopped. Its FIT file contains accurate workout metrics collected from a connected treadmill including correct elevation/altitude calculated from treadmill incline.

Usage:
- In the RepairZwiftFIT installation folder, edit the provided batch files (merge-by-day.bat and merge-all-dates.bat) to set the FIT file location folders for both Zwift and QZ Fitness. By default, Zwift Windows stores its FIT files in %USERPROFILE%\Documents\Zwift\Activities. QZ Fitness for Windows is flexible and can be installed in any location.
- Launch QZ with settings to connect to your treadmill. Ensure QZ is not in paused state.
- Launch Zwift in Run mode and ensure Speed is paired to QZ.
- Complete one or more Zwift activities (manual run, workout, event, or meetup) using manual or auto incline.
- When done, exit Zwift and QZ.
- In the RepairZwiftFIT installation folder, run the appropriate batch file to locate and merge Zwift and QZ Fitness files. The resulting FIT files are exported to the /merged folder within the installation folder.
- Merge-by-day.bat - use to merge FIT files by a specific date (hit enter to accept todays date).
- Merge-all-dates.bat - use to merge all FIT files by date. Only dates common with the Zwift and QZ files will be used.
