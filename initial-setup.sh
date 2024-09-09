#!/bin/bash

# Prompt the user for input
read -p -r 'Project name (readable version): ' ProjectName
read -p -r 'Brief resume of this project: ' ProjectDescription
read -p -r 'GitHub username: ' GitHubUsername
read -p -r 'GitHub repository: ' GitHubRepo
read -p -r 'AppVeyor project ID (badge): ' AppVeyorId
read -p -r 'API documentation URL: ' DocumentationWebsite

# Remove and rename files
rm README.md
mv "README.template.md" "README.md"

rm Cargo.toml
mv "Cargo.toml.template" "Cargo.toml"

# Replace placeholders in README.md
sed -i "s/{username}/$GitHubUsername/g" README.md
sed -i "s/{repo}/$GitHubRepo/g" README.md
sed -i "s/{appVeyorId}/$AppVeyorId/g" README.md
sed -i "s/{Project Name}/$ProjectName/g" README.md
sed -i "s/{Project Description}/$ProjectDescription/g" README.md
sed -i "s/https:\/\/project.name.com\//$DocumentationWebsite/" README.md

# Replace placeholders in .wakatime-project
sed -i "s/API Client Boilerplate .NET/$ProjectName SDK .NET/" .wakatime-project

# Replace placeholders in _config.yml
sed -i "s/API Client Boilerplate/$ProjectName/" _config.yml
sed -i "s/A template repository for .NET API clients projects./$ProjectDescription/" _config.yml
sed -i "s/GuilhermeStracini\/apiclient-boilerplate-dotnet/$GitHubUsername\/$GitHubRepo/" _config.yml

# Remove initial-setup files
rm initial-setup.bat
rm initial-setup.ps1
rm initial-setup.sh
