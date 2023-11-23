##Set Variables
$name = "macOS Compliance"
$description = "Compliance Policy for macOS Devices"
$groupid = "00000000-0000-0000-0000-000000000000"

##Set URL
$url = "https://graph.microsoft.com/beta/deviceManagement/deviceCompliancePolicies"

##Populate JSON Body
$json = @"
{
	"@odata.type": "#microsoft.graph.macOSCompliancePolicy",
	"description": "$description",
	"displayName": "$name",
	"firewallEnabled": true,
	"firewallEnableStealthMode": true,
	"gatekeeperAllowedAppSource": "macAppStoreAndIdentifiedDevelopers",
	"id": "00000000-0000-0000-0000-000000000000",
	"passwordBlockSimple": true,
	"passwordExpirationDays": 41,
	"passwordMinimumCharacterSetCount": 1,
	"passwordMinutesOfInactivityBeforeLock": 5,
	"passwordPreviousPasswordBlockCount": 3,
	"passwordRequired": true,
	"passwordRequiredType": "alphanumeric",
	"roleScopeTagIds": [
		"0"
	],
	"scheduledActionsForRule": [
		{
			"ruleName": "PasswordRequired",
			"scheduledActionConfigurations": [
				{
					"actionType": "block",
					"gracePeriodHours": 0,
					"notificationMessageCCList": [],
					"notificationTemplateId": ""
				},
				{
					"actionType": "remoteLock",
					"gracePeriodHours": 480,
					"notificationMessageCCList": [],
					"notificationTemplateId": ""
				},
				{
					"actionType": "retire",
					"gracePeriodHours": 1080,
					"notificationMessageCCList": [],
					"notificationTemplateId": ""
				}
			]
		}
	],
	"storageRequireEncryption": true,
	"systemIntegrityProtectionEnabled": true
}
"@

##Create Policy
write-host "Creating Policy"
$assignpolicy = Invoke-MgGraphRequest -Uri $url -Method POST -Body $json -ContentType "application/json" -OutputType PSObject
write-host "Policy Created"

##Get Policy ID
$policyid = $assignpolicy.id
write-host "Policy ID: $policyid"

##Populate Assignment URL
$assignurl = "https://graph.microsoft.com/beta/deviceManagement/deviceCompliancePolicies/$policyid/assign"

##Populate Assignment JSON
$assignjson = @"
{
	"assignments": [
		{
			"target": {
				"@odata.type": "#microsoft.graph.groupAssignmentTarget",
				"groupId": "$groupid"
			}
		}
	]
}
"@

##Assign Policy
write-host "Assigning Policy"
Invoke-MgGraphRequest -Uri $assignurl -Method POST -Body $assignjson -ContentType "application/json" -OutputType PSObject
write-host "Policy Assigned"