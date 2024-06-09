' Gets the current directory name
Set WSHShell = CreateObject("WScript.Shell")
currentDir = WSHShell.CurrentDirectory
currentDirName = Split(currentDir, "\")(UBound(Split(currentDir, "\")))

' Create README.md file
Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objFile = objFSO.CreateTextFile(currentDir & "\README.md", True)
objFile.Close

' Initialize git repository
WSHShell.Run "cmd /c git init", vbMinimizedNoFocus
WSHShell.Run "cmd /c git remote add all ""https://github.com/Notoric/" & currentDirName & ".git""", vbMinimizedNoFocus
WSHShell.Run "cmd /c git remote set-url --add --push all ""https://github.com/Notoric/" & currentDirName & ".git""", vbMinimizedNoFocus
WSHShell.Run "cmd /c git remote set-url --add --push all ""https://gitea.notoricloud.net/Notoric/" & currentDirName & ".git""", vbMinimizedNoFocus
WSHShell.Run "cmd /c git add README.md", vbMinimizedNoFocus
WSHShell.Run "cmd /c git branch -M main", vbMinimizedNoFocus
WSHShell.Run "cmd /c git commit -m ""initial commit""", vbMinimizedNoFocus
WSHShell.Run "cmd /c git push all main", vbMinimizedNoFocus

' Clean up 
Set WSHShell = Nothing
Set objFSO = Nothing