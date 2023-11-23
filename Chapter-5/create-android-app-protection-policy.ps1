##Set variables
$name = "Android App Protection Policy"
$description = "Microsoft Apps Only"
$groupid = "00000000-0000-0000-0000-000000000000"

##Set URL
$url = "https://graph.microsoft.com/beta/deviceAppManagement/androidManagedAppProtections"

##Populate JSON
$json = @"
{
	"@odata.type": "#microsoft.graph.androidManagedAppProtection",
	"allowedAndroidDeviceManufacturers": "",
	"allowedDataIngestionLocations": [
		"oneDriveForBusiness",
		"sharePoint"
	],
	"allowedDataStorageLocations": [
		"oneDriveForBusiness",
		"sharePoint"
	],
	"allowedInboundDataTransferSources": "managedApps",
	"allowedOutboundClipboardSharingExceptionLength": 0,
	"allowedOutboundClipboardSharingLevel": "managedAppsWithPasteIn",
	"allowedOutboundDataTransferDestinations": "managedApps",
	"appActionIfAccountIsClockedOut": null,
	"appActionIfAndroidDeviceManufacturerNotAllowed": "block",
	"appActionIfAndroidSafetyNetAppsVerificationFailed": "block",
	"appActionIfAndroidSafetyNetDeviceAttestationFailed": "block",
	"appActionIfDeviceComplianceRequired": "block",
	"appActionIfDeviceLockNotSet": "block",
	"appActionIfDevicePasscodeComplexityLessThanHigh": null,
	"appActionIfDevicePasscodeComplexityLessThanLow": null,
	"appActionIfDevicePasscodeComplexityLessThanMedium": "block",
	"appActionIfMaximumPinRetriesExceeded": "block",
	"appActionIfUnableToAuthenticateUser": "block",
	"appGroupType": "allMicrosoftApps",
	"approvedKeyboards": [],
	"apps": [],
	"assignments": [
		{
			"target": {
				"@odata.type": "#microsoft.graph.groupAssignmentTarget",
				"deviceAndAppManagementAssignmentFilterId": null,
				"deviceAndAppManagementAssignmentFilterType": "none",
				"groupId": "$groupid"
			}
		}
	],
	"biometricAuthenticationBlocked": false,
	"blockAfterCompanyPortalUpdateDeferralInDays": 0,
	"blockDataIngestionIntoOrganizationDocuments": true,
	"connectToVpnOnLaunch": false,
	"contactSyncBlocked": true,
	"customBrowserDisplayName": "",
	"customBrowserPackageId": "",
	"customBrowserProtocol": "",
	"customDialerAppDisplayName": "",
	"customDialerAppPackageId": "",
	"customDialerAppProtocol": "",
	"dataBackupBlocked": true,
	"description": "$description",
	"deviceComplianceRequired": true,
	"deviceLockRequired": false,
	"dialerRestrictionLevel": "managedApps",
	"disableAppEncryptionIfDeviceEncryptionIsEnabled": false,
	"disableAppPinIfDevicePinIsSet": false,
	"displayName": "$name",
	"encryptAppData": true,
	"exemptedAppPackages": [],
	"exemptedAppProtocols": [
		{
			"name": "Default",
			"value": "skype;app-settings;calshow;itms;itmss;itms-apps;itms-appss;itms-services;"
		}
	],
	"fingerprintAndBiometricEnabled": true,
	"fingerprintBlocked": false,
	"gracePeriodToBlockAppsDuringOffClockHours": null,
	"keyboardsRestricted": false,
	"managedBrowser": "microsoftEdge",
	"managedBrowserToOpenLinksRequired": true,
	"maximumAllowedDeviceThreatLevel": "notConfigured",
	"maximumPinRetries": 5,
	"maximumRequiredOsVersion": null,
	"maximumWarningOsVersion": null,
	"maximumWipeOsVersion": null,
	"minimumPinLength": 6,
	"minimumRequiredAppVersion": null,
	"minimumRequiredCompanyPortalVersion": null,
	"minimumRequiredOsVersion": null,
	"minimumRequiredPatchVersion": null,
	"minimumWarningAppVersion": null,
	"minimumWarningCompanyPortalVersion": null,
	"minimumWarningOsVersion": null,
	"minimumWarningPatchVersion": null,
	"minimumWipeAppVersion": null,
	"minimumWipeCompanyPortalVersion": null,
	"minimumWipeOsVersion": null,
	"minimumWipePatchVersion": null,
	"mobileThreatDefensePartnerPriority": null,
	"mobileThreatDefenseRemediationAction": "block",
	"notificationRestriction": "allow",
	"organizationalCredentialsRequired": false,
	"periodBeforePinReset": "P0D",
	"periodBeforePinResetRequired": false,
	"periodOfflineBeforeAccessCheck": "PT720M",
	"periodOfflineBeforeWipeIsEnforced": "P90D",
	"periodOnlineBeforeAccessCheck": "PT30M",
	"pinCharacterSet": "numeric",
	"pinRequired": true,
	"pinRequiredInsteadOfBiometric": true,
	"pinRequiredInsteadOfBiometricTimeout": "PT30M",
	"previousPinBlockCount": 0,
	"printBlocked": true,
	"requireClass3Biometrics": false,
	"requiredAndroidSafetyNetAppsVerificationType": "enabled",
	"requiredAndroidSafetyNetDeviceAttestationType": "basicIntegrity",
	"requiredAndroidSafetyNetEvaluationType": "basic",
	"requirePinAfterBiometricChange": false,
	"roleScopeTagIds": [],
	"saveAsBlocked": true,
	"screenCaptureBlocked": true,
	"shareWithBrowserVirtualSetting": "anyApp",
	"simplePinBlocked": true,
	"targetedAppManagementLevels": "unspecified",
	"warnAfterCompanyPortalUpdateDeferralInDays": 0,
	"wipeAfterCompanyPortalUpdateDeferralInDays": 0
}
"@

##Create policy
Write-Host "Creating policy $name"
Invoke-MgGraphRequest -Method POST -Uri $url -Body $json -ContentType "application/json"
Write-Host "Policy created successfully"