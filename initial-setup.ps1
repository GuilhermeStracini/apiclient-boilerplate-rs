$ProjectName = Read-Host -Prompt 'Project name (readable version)'
$ProjectDescription = Read-Host -Prompt 'Brief resume of this project'
$GitHubUsername = Read-Host -Prompt 'GitHub username'
$GitHubRepo = Read-Host -Prompt 'GitHub repository'
$AppVeyorId = Read-Host -Prompt 'AppVeyor project ID'

(Get-Content README.md) | Select-Object -Skip 19 | Set-Content README.md

(Get-Content README.md) | ForEach-Object { $_ -replace "{username}", $GitHubUsername } | Set-Content README.md
(Get-Content README.md) | ForEach-Object { $_ -replace "{repo}", $GitHubRepo } | Set-Content README.md
(Get-Content README.md) | ForEach-Object { $_ -replace "{appVeyorId}", $AppVeyorId } | Set-Content README.md
(Get-Content README.md) | ForEach-Object { $_ -replace "API Client Boilerplate", $ProjectName } | Set-Content README.md

(Get-Content _config.yml) | ForEach-Object { $_ -replace "API Client Boilerplate .NET", "$ProjectName Rust SDK Client" } | Set-Content _config.yml
(Get-Content _config.yml) | ForEach-Object { $_ -replace "A template repository for Rust API clients projects.", $ProjectDescription } | Set-Content _config.yml
(Get-Content _config.yml) | ForEach-Object { $_ -replace "GuilhermeStracini/apiclient-boilerplate-rs", "$GitHubUsername/$GitHubRepo" } | Set-Content _config.yml

Remove-Item initial-setup.bat
Remove-Item initial-setup.ps1
