@dir /w /og %* | ^
find /v "Volume in drive" | ^
find /v "Volume Serial Number" | ^
find /v "File(s)" | ^
find /v "Dir(s)" | ^
find /v "Directory of" | ^
findstr /v "^$"

@echo.

