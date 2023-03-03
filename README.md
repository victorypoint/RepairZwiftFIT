# RepairZwiftFIT
Repair Zwift FIT file by merging with QZ Fitness FIT file to add Zwift location data

RepairZwiftFIT is currently a Windows 10/11 command-line or batch solution to resolve a problem with Zwift FIT files. That is, Zwift calculates elevation/altitude incorrectly for treadmill incline. Specifically, negative incline is assigned 0 elevation. QZ FIT files, when synced to Zwift activities, don’t contain Zwift's location data (virtual lat/long), but they do contain correct calculated elevation. Zmerge will merge Zwift FIT location data (and other important data fields) with QZ FIT data including calculated elevation.

Requires Oracle Java™ Runtime Environment 8 - 1.8.0 or higher.
Requires QZ Fitness app (available on iOS, Android, Windows)
RepairZwiftFIT can be run from Windows command-line or as a batch file.

Background:
- Zwift records a FIT file for each treadmill activity (manual run, workout, event, or meetup). Note that these FIT files contain incorrect elevation data for treadmill incline as described above.
- QZ Fitness records a FIT file whenever a workout is manually started and stopped. It's FIT files contain accurate workout metrics collected from the connected treadmill including correct elevation calculated from treadmill incline.



