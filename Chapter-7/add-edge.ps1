##Set URL
$url = "https://graph.microsoft.com/beta/deviceAppManagement/mobileApps/"

##Options are stable, dev or beta
$channel = "stable"
$groupid = "00000000-0000-0000-0000-000000000000"

##Populate JSON
$json = @"
{
	"@odata.type": "#microsoft.graph.macOSMicrosoftEdgeApp",
	"channel": "$channel",
	"description": "Microsoft Edge is the browser for business with modern and legacy web compatibility, new privacy features such as Tracking prevention, and built-in productivity tools such as enterprise-grade PDF support and access to Office and corporate search right from a new tab.",
	"developer": "Microsoft",
	"displayName": "Microsoft Edge for macOS",
	"informationUrl": "https://www.microsoft.com/windows/microsoft-edge",
	"isFeatured": false,
	"largeIcon": {
		"type": "image/png",
		"value": "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"
	},
	"notes": "",
	"owner": "",
	"privacyInformationUrl": "https://privacy.microsoft.com/privacystatement",
	"publisher": "Microsoft",
	"roleScopeTagIds": []
}
"@

##Create the app
write-host "Creating Edge Application"
$mobileapp = Invoke-MgGraphRequest -Url $url -Method Post -Body $json -ContentType "application/json" -OutputType PSObject
write-host "Edge Application Created"

##Get the App id
$mobileappid = $mobileapp.id
write-host "Edge Application ID: $mobileappid"

##Add ID to URL
$assignurl = "https://graph.microsoft.com/beta/deviceAppManagement/mobileApps/$mobileappid/assign"

##Populate JSON
$assignjson = @"
{
	"mobileAppAssignments": [
		{
			"@odata.type": "#microsoft.graph.mobileAppAssignment",
			"intent": "Required",
			"settings": null,
			"target": {
				"@odata.type": "#microsoft.graph.groupAssignmentTarget",
				"groupId": "$groupid"
			}
		}
	]
}
"@

##Assign the app
write-host "Assigning Edge Application"
Invoke-MgGraphRequest -Uri $assignurl -Method Post -Body $assignjson -ContentType "application/json"
write-host "Edge Application Assigned"