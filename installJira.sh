#! /bin/bash

installationDir="/opt/atlassian/jira"
homeDir="/var/atlassian/application-data/jira"

atlassian-jira-software-$1-standalone
wget "https://www.atlassian.com/software/jira/downloads/binary/atlassian-jira-software-$1.tar.gz"
mkdir -p $installationDir
mkdir -p $homeDiir
tar -xvf atlassian-jira-software-$1.tar.gz -C $installationDiir
mv /opt/atlassian/jira/atlassian-jira-software-$1-standalone/* /opt/atlassian/jira && rmdir /opt/atlassian/jira/atlassian-jira-software-$1-standalone/*
useradd -d $homeDir -s /bin/false jira
givePermissions($installationDir)
givePermissions($installationDir)

givePermissions() {
	chown -R jira $1
	chmod -R u=rwx,go-rwx $1
}
