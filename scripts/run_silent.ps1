# 1. Define the path to your existing attendance script
$ScriptToRun = "C:\Hippo_erp_bot\scripts\auto_attendance.ps1"

# 2. Create the Action (What to do)
$Action = New-ScheduledTaskAction -Execute 'PowerShell.exe' `
    -Argument "-ExecutionPolicy Bypass -WindowStyle Hidden -File `"$ScriptToRun`""

# 3. Create the Triggers (When to do it)
$Trigger1 = New-ScheduledTaskTrigger -Daily -At 9:01am
$Trigger2 = New-ScheduledTaskTrigger -Daily -At 7:51pm

# 4. Register the Task
Register-ScheduledTask -TaskName "HippoCloudAttendanceBot" `
    -Trigger $Trigger1, $Trigger2 `
    -Action $Action `
    -Description "Runs the attendance bot at check-in and check-out times." `
    -Settings (New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries) `
    -Force

Write-Host "Success! Attendance bot scheduled for 09:01 and 19:51." -ForegroundColor Green