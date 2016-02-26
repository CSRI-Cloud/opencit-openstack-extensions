; Script generated by the HM NIS Edit Script Wizard.

!include "MUI.nsh"
!include "MUI2.nsh"
!include "InstallOptions.nsh"
!include "LogicLib.nsh"
!include "winmessages.nsh"
!include "wordfunc.nsh"
!include "FileFunc.nsh"
!include "nsDialogs.nsh"
!include psexec.nsh

!define PRODUCT_NAME "Openstack-extension"
!define PRODUCT_VERSION "1.0"
!define PRODUCT_PUBLISHER "Intel, Inc."
!define PRODUCT_WEB_SITE "http://www.intel.com"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"
!define ENABLE_LOGGING

!include "TextLog.nsh"

; MUI 1.67 compatible ------
!include "MUI.nsh"

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\modern-install.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico"

!define WriteToFile `!insertmacro WriteToFile false`
!define WriteLineToFile `!insertmacro WriteToFile true`

; Welcome page
!insertmacro MUI_PAGE_WELCOME
; License page
#!insertmacro MUI_PAGE_LICENSE "license.txt"
; Directory page
!insertmacro MUI_PAGE_DIRECTORY
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES
; Finish page
!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
!insertmacro MUI_UNPAGE_INSTFILES

; Language files
!insertmacro MUI_LANGUAGE "English"

; MUI end ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "Installer.exe"
InstallDir "$PROGRAMFILES\Intel\Openstack-extension"
ShowInstDetails show
ShowUnInstDetails show

Function .onInit
	Var /GLOBAL Logfile
    StrCpy $Logfile "$INSTDIR\logs\patchInstallLog.txt"
	${LogSetFileName} $Logfile
	${LogSetOn}
FunctionEnd

Function Error_Log_File
	MessageBox MB_OK "Error occurred.... Please refer to logs in $INSTDIR\logs\patchInstallLog.txt"
	Abort ; causes installer to quit.
FunctionEnd

Section "openstack-extension" SEC01
  # Set output path to the installation directory (also sets the working directory for shortcuts)
  SetOutPath "$INSTDIR"
	
  ${LogText} "Copying files to installation directory"

  # bin directory
  SetOutPath "$INSTDIR\bin"
  SetOverwrite try
  File "bin/mtwilson-openstack-node-uninstall.ps1"
  File "bin/patch-util-win.cmd"
  File "bin/setup.ps1"
  
  # env directory
  SetOutPath "$INSTDIR\env"
  
  # logs directory
  SetOutPath "$INSTDIR\logs"
   
  # repository directory
  SetOutPath "$INSTDIR\repository"
  
  # mtwilson-openstack-policyagent-hooks directory
  SetOutPath "$INSTDIR\repository\mtwilson-openstack-policyagent-hooks"
  
  # mtwilson-openstack-policyagent-hooks patches for available openstack versions
  SetOutPath "$INSTDIR\repository\mtwilson-openstack-policyagent-hooks\2014.1"
  File "repository/mtwilson-openstack-policyagent-hooks/2014.1/distribution-location.patch"

  SetOutPath "$INSTDIR\repository\mtwilson-openstack-policyagent-hooks\2014.1.3"
  File "repository/mtwilson-openstack-policyagent-hooks/2014.1.3/distribution-location.patch"

  SetOutPath "$INSTDIR\repository\mtwilson-openstack-policyagent-hooks\2014.1.4"
  File "repository/mtwilson-openstack-policyagent-hooks/2014.1.4/distribution-location.patch"

  SetOutPath "$INSTDIR\repository\mtwilson-openstack-policyagent-hooks\2014.1.5"
  File "repository/mtwilson-openstack-policyagent-hooks/2014.1.5/distribution-location.patch"

  SetOutPath "$INSTDIR\repository\mtwilson-openstack-policyagent-hooks\2014.1.5-0ubuntu1.2"
  File "repository/mtwilson-openstack-policyagent-hooks/2014.1.5-0ubuntu1.2/distribution-location.patch"

  SetOutPath "$INSTDIR\repository\mtwilson-openstack-policyagent-hooks\2014.2"
  File "repository/mtwilson-openstack-policyagent-hooks/2014.2/distribution-location.patch"

  SetOutPath "$INSTDIR\repository\mtwilson-openstack-policyagent-hooks\2014.2.3"
  File "repository/mtwilson-openstack-policyagent-hooks/2014.2.4/distribution-location.patch"

  SetOutPath "$INSTDIR\repository\mtwilson-openstack-policyagent-hooks\2015.1.1"
  File "repository/mtwilson-openstack-policyagent-hooks/2015.1.1/distribution-location.patch"

  SetOutPath "$INSTDIR\repository\mtwilson-openstack-policyagent-hooks\2015.1.2"
  File "repository/mtwilson-openstack-policyagent-hooks/2015.1.2/distribution-location.patch"

  SetOutPath "$INSTDIR\repository\mtwilson-openstack-policyagent-hooks\nt_2015.1.0"
  File "repository/mtwilson-openstack-policyagent-hooks/nt_2015.1.0/distribution-location.patch"

  # mtwilson-openstack-vm-attestation directory
  SetOutPath "$INSTDIR\repository\mtwilson-openstack-vm-attestation"
  
  # mtwilson-openstack-vm-attestation patches for available openstack versions
  SetOutPath "$INSTDIR\repository\mtwilson-openstack-vm-attestation\2014.1"
  File "repository/mtwilson-openstack-vm-attestation/2014.1/distribution-location.patch"

  SetOutPath "$INSTDIR\repository\mtwilson-openstack-vm-attestation\2014.1.3"
  File "repository/mtwilson-openstack-vm-attestation/2014.1.3/distribution-location.patch"

  SetOutPath "$INSTDIR\repository\mtwilson-openstack-vm-attestation\2014.1.4"
  File "repository/mtwilson-openstack-vm-attestation/2014.1.4/distribution-location.patch"

  SetOutPath "$INSTDIR\repository\mtwilson-openstack-vm-attestation\2014.1.5"
  File "repository/mtwilson-openstack-vm-attestation/2014.1.5/distribution-location.patch"
 
  SetOutPath "$INSTDIR\repository\mtwilson-openstack-vm-attestation\2014.2"
  File "repository/mtwilson-openstack-vm-attestation/2014.2/distribution-location.patch"

  SetOutPath "$INSTDIR\repository\mtwilson-openstack-vm-attestation\2014.2.3"
  File "repository/mtwilson-openstack-vm-attestation/2014.2.3/distribution-location.patch"
 
  SetOutPath "$INSTDIR\repository\mtwilson-openstack-vm-attestation\2015.1.1"
  File "repository/mtwilson-openstack-vm-attestation/2015.1.1/distribution-location.patch"

  SetOutPath "$INSTDIR\repository\mtwilson-openstack-vm-attestation\nt_2015.1.0"
  File "repository/mtwilson-openstack-vm-attestation/nt_2015.1.0/distribution-location.patch"

  SetOutPath "$INSTDIR\pre-requisites"

  SetOutPath "$INSTDIR"
  
  SetOverwrite ifnewer

  # Create System Environment Variable - OPENSTACK_EXT_HOME
  !define env_hklm 'HKLM "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"'
  !define env_hkcu 'HKCU "Environment"'
  WriteRegExpandStr ${env_hklm} OPENSTACK_EXT_HOME $INSTDIR
  SendMessage ${HWND_BROADCAST} ${WM_WININICHANGE} 0 "STR:Environment" /TIMEOUT=5000
    
SectionEnd

Section "getNovaProperties" SEC02

  # read variables from trustagent configuration to input to nova.conf
  Var /GLOBAL trustagentHomeDir
  StrCpy $trustagentHomeDir "C:\Program Files (x86)\Intel\TrustAgent"
  
  Var /GLOBAL trustagentConfDir
  StrCpy $trustagentConfDir "$trustagentHomeDir\configuration"
  
  Var /GLOBAL trustagentPropertiesFile
  StrCpy $trustagentPropertiesFile "$trustagentConfDir\trustagent.properties"
  IfFileExists "$trustagentPropertiesFile"  exists doesnotexist
    exists:
		goto end_of_check
    doesnotexist:
        ${LogText} "Could not find $trustagentPropertiesFile \n Mtwilson Trust Agent must be installed first"
		Call Error_Log_File
    end_of_check:
  
  Var /GLOBAL cygwinpath
  StrCpy $cygwinpath "C:\cygwin64\bin"
  
  Var /GLOBAL mtwilsonServer
  # Error Code = $0. Output = $1 for nsExec.
  ${PowerShellExec} "Get-Content '$trustagentPropertiesFile' | Select-String 'mtwilson.api.url' | ForEach-Object {$_.Line.Split('/')[2].Split('\')[0]}"
  Call Trim
  Pop $R1
  StrCpy $mtwilsonServer $R1
  ${If} "$mtwilsonServer" == "" 
	${LogText} "Error reading CIT Server IP from configuration."
	Call Error_Log_File
  ${EndIf} 
  
  Var /GLOBAL mtwilsonServerPort
  ${PowerShellExec} "Get-Content '$trustagentPropertiesFile' | Select-String 'mtwilson.api.url' | ForEach-Object {$_.Line.Split('/')[2].Split(':')[1]}"
  Call Trim
  Pop $R1
  StrCpy $mtwilsonServerPort $R1
  ${If} "$mtwilsonServerPort" == ""
	${LogText} "Error reading CIT Server port from configuration."
	Call Error_Log_File
  ${EndIf} 

  Var /GLOBAL mtwilsonVmAttestationApiUsername
  ${PowerShellExec} "Get-Content '$trustagentPropertiesFile' | Select-String 'mtwilson.api.username' | ForEach-Object {$_.Line.Split('=')[1].Split('')[0]}"
  Call Trim
  Pop $R1
  StrCpy $mtwilsonVmAttestationApiUsername $R1
  ${If} "$mtwilsonVmAttestationApiUsername" == ""
	${LogText} "Error reading CIT VM attestation API username from configuration."
	Call Error_Log_File
  ${EndIf} 

  Var /GLOBAL mtwilsonVmAttestationApiPassword
  ${PowerShellExec} "Get-Content '$trustagentPropertiesFile' | Select-String 'mtwilson.api.password' | ForEach-Object {$_.Line.Split('=')[1].Split('')[0]}"
  Call Trim
  Pop $R1
  StrCpy $mtwilsonVmAttestationApiPassword $R1
  ${If} "$mtwilsonVmAttestationApiPassword" == ""
	${LogText} "Error reading CIT VM attestation API password from configuration."
	Call Error_Log_File
  ${EndIf} 
  
  Var /GLOBAL mtwilsonVmAttestationApiUrlPath
  StrCpy $mtwilsonVmAttestationApiUrlPath "/mtwilson/v2/vm-attestations"
  Var /GLOBAL mtwilsonVmAttestationAuthBlob
  Push $mtwilsonVmAttestationApiUsername:$mtwilsonVmAttestationApiPassword
  Call Trim
  Pop $0
  StrCpy $mtwilsonVmAttestationAuthBlob "$0"
  
SectionEnd

Section "updateNovaConfFile" SEC03
  # update nova.conf
  Var /GLOBAL novaConfFile
  StrCpy $novaConfFile "C:\Program Files (x86)\Cloudbase Solutions\OpenStack\Nova\etc\nova.conf"
  
  IfFileExists "$novaConfFile" exists doesnotexist
  exists:
	${LogText} "Nova configuration file is located at: $novaConfFile"
	goto end_of_check
  doesnotexist:
        ${LogText} "Could not find $novaConfFile \n OpenStack compute node must be installed first."
		Call Error_Log_File
  end_of_check:
  
  Push "attestation_server_ip" 
  Push $mtwilsonServer
  Push "trusted_computing" 
  Push $novaConfFile
  Call updateNovaConfFunc 
	
  Push "attestation_server_port" 
  Push $mtwilsonServerPort
  Push "trusted_computing" 
  Push $novaConfFile
  Call updateNovaConfFunc
  
  Push "attestation_api_url" 
  Push $mtwilsonVmAttestationApiUrlPath
  Push "trusted_computing" 
  Push $novaConfFile
  Call updateNovaConfFunc
  
  Push "attestation_auth_blob" 
  Push $mtwilsonVmAttestationAuthBlob
  Push "trusted_computing" 
  Push $novaConfFile
  Call updateNovaConfFunc
	  
SectionEnd

Function updateNovaConfFunc
  
	Var /GLOBAL novaconf
	Call Trim
	Pop $0 
	StrCpy $novaconf $0
	${LogText} "novaconf value is: $novaConf"
	Var /GLOBAL header
	Call Trim
	Pop $1 
    StrCpy $header $1
	${LogText} "header value is: $header"
	Var /GLOBAL value
	Call Trim
	Pop $2
	StrCpy $value $2
	${LogText} "value value is: $value"
	Var /GLOBAL property
	Call Trim
	Pop $3 
	StrCpy $property $3
	${LogText} "property value is: $property"
	
		
	# Check if header exists   
	Var /GLOBAL headerExists
	${PowerShellExec} "Get-Content '$novaconf' | Select-String -pattern '\[$header]'"
	Call Trim
	Pop $R1
	Strcpy $headerExists $R1
	
	${LogText} "Header exists $R1"
	${If} $headerExists == ""
		${LogText} "Header is empty, so adding new header."
		${PowerShellExec} "Add-Content '$novaconf' '# Intel(R) Cloud Integrity Technology'"
		${PowerShellExec} "Add-Content '$novaconf' [$header]"
	${EndIf}

	# Remove comment if property is available and commented
	${PowerShellExec} "(Get-Content '$novaconf') | ForEach-Object { if($_ -match ('^#$property')) {$_ -Replace '#$property', '$property'} else {$_} } | Set-Content '$novaconf'"

	# Check if property exists
	 
	Var /GLOBAL propertyExists
	${PowerShellExec} "Get-Content '$novaconf' | Select-String '$property'"
	Call Trim
	Pop $R1
	Strcpy $propertyExists $R1
	${LogText} "Property exists and its value is $propertyExists"
	${If} $propertyExists == ""
		${PowerShellExec} "Add-Content '$novaconf' '$property=$value'"
	${Else}
    	# Updating property value if property exists
		${LogText} "Updating existing property $property with value $value"
		Var /GLOBAL updateProp
		Push "$property=$value"
		Call Trim
		Pop $R1
		Strcpy $updateProp $R1
		${PowerShellExec} "(Get-Content '$novaconf') | ForEach-Object { if($_ -match ('$property')) {$_ -Replace '$property=.*', '$updateProp'} else {$_} } | Set-Content '$novaconf'"
	${EndIf}

FunctionEnd
	
Function Trim
	Exch $R1 ; Original string
	Push $R2
 
Loop:
	StrCpy $R2 "$R1" 1
	StrCmp "$R2" " " TrimLeft
	StrCmp "$R2" "$\r" TrimLeft
	StrCmp "$R2" "$\n" TrimLeft
	StrCmp "$R2" "$\t" TrimLeft
	GoTo Loop2
TrimLeft:	
	StrCpy $R1 "$R1" "" 1
	Goto Loop
 
Loop2:
	StrCpy $R2 "$R1" 1 -1
	StrCmp "$R2" " " TrimRight
	StrCmp "$R2" "$\r" TrimRight
	StrCmp "$R2" "$\n" TrimRight
	StrCmp "$R2" "$\t" TrimRight
	GoTo Done
TrimRight:	
	StrCpy $R1 "$R1" -1
	Goto Loop2
 
Done:
	Pop $R2
	Exch $R1
	
FunctionEnd

Section "runUtilityScript" SEC04
	# Check if patch-util-win.bat file exists
	IfFileExists "$INSTDIR\bin\patch-util-win.cmd" exists doesnotexist
	exists:
		IfFileExists "$INSTDIR\bin\setup.ps1" existssetup doesnotexistsetup
		existssetup:
			${LogText} "Executing setup script."
			${LogText} "Note: If proper uninstallation is not done previously then applying patches might fail. To successfully apply patches please do proper uninstallation before installing Openstack-extension"
			${PowerShellExec} "& '$INSTDIR\bin\setup.ps1'"
			Pop $R1
			${LogText} "Powershell executing output is: $R1"
			${LogText} "Setup script executed successfully"
			goto end_of_check
		doesnotexistsetup:
			${LogText} "Setup script does not exists"	
			Call Error_Log_File
	doesnotexist:
        ${LogText} "Patch utility script does not exists"
		Call Error_Log_File
    end_of_check:
SectionEnd
  
Section -AdditionalIcons
  CreateDirectory "$SMPROGRAMS\"
  CreateShortCut "$SMPROGRAMS\Openstack-extension\Uninstall.lnk" "$INSTDIR\uninst.exe"
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
SectionEnd

Function un.onUninstSuccess
  HideWindow
  MessageBox MB_ICONINFORMATION|MB_OK "$(^Name) was successfully removed from your computer."
FunctionEnd

Function un.onInit
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "Are you sure you want to completely remove $(^Name) and all of its components?" IDYES +2
  Abort
FunctionEnd

Function un.Error_Log_File
	MessageBox MB_OK "Error occurred.... Please refer to logs in $INSTDIR\logs\patchUninstallLog.txt"
	Abort ; causes installer to quit.
FunctionEnd

Section Uninstall
  # Check if mtwilson-openstack-node-uninstall.ps1 file exists
  IfFileExists "$INSTDIR\bin\mtwilson-openstack-node-uninstall.ps1" existsuninst doesnotexistuninst
	existsuninst:
		FileOpen $0 "$INSTDIR\logs\patchUninstallLog.txt" a 
		FileSeek $0 0 END
		FileWrite $0 "Executing uninstall script to revert patches."
		FileClose $0
		${PowerShellExec} "& '$INSTDIR\bin\mtwilson-openstack-node-uninstall.ps1'"
		Pop $0
		FileOpen $0 "$INSTDIR\logs\patchUninstallLog.txt" a 
		FileSeek $0 0 END
		FileWrite $0 "Powershell executing output is: Error : $0"
		FileWrite $0 "Patches uninstallated successfully."
		FileClose $0 
		goto end_of_check_uninst
	doesnotexistuninst:
		FileOpen $0 "$INSTDIR\logs\patchUninstallLog.txt" a 
		FileSeek $0 0 END
		FileWrite $0 "Uninstall script does not exists"
		FileClose $0 
		Call un.Error_Log_File
	end_of_check_uninst:
  Delete "$INSTDIR\uninst.exe"
  Delete "$INSTDIR\bin\patch-util-win.cmd"
  Delete "$INSTDIR\bin\setup.ps1"
  Delete "$INSTDIR\bin\mtwilson-openstack-node-uninstall.ps1"
  Delete "$INSTDIR\logs\patchInstallLog.txt"
  Delete "$INSTDIR\logs\patchUninstallLog.txt"
  Delete "$INSTDIR\repository\mtwilson-openstack-policyagent-hooks\2014.1\distribution-location.patch"
  Delete "$INSTDIR\repository\mtwilson-openstack-policyagent-hooks\2014.1.3\distribution-location.patch"
  Delete "$INSTDIR\repository\mtwilson-openstack-policyagent-hooks\2014.1.4\distribution-location.patch"
  Delete "$INSTDIR\repository\mtwilson-openstack-policyagent-hooks\2014.1.5\distribution-location.patch"
  Delete "$INSTDIR\repository\mtwilson-openstack-policyagent-hooks\2014.1.5-0ubuntu1.2\distribution-location.patch"
  Delete "$INSTDIR\repository\mtwilson-openstack-policyagent-hooks\2014.2\distribution-location.patch"
  Delete "$INSTDIR\repository\mtwilson-openstack-policyagent-hooks\2014.2.3\distribution-location.patch"
  Delete "$INSTDIR\repository\mtwilson-openstack-policyagent-hooks\2014.2.4\distribution-location.patch"
  Delete "$INSTDIR\repository\mtwilson-openstack-policyagent-hooks\2015.1.1\distribution-location.patch"
  Delete "$INSTDIR\repository\mtwilson-openstack-policyagent-hooks\2015.1.2\distribution-location.patch"
  Delete "$INSTDIR\repository\mtwilson-openstack-policyagent-hooks\nt_2015.1.0\distribution-location.patch"
  Delete "$INSTDIR\repository\mtwilson-openstack-vm-attestation\2014.1\distribution-location.patch"
  Delete "$INSTDIR\repository\mtwilson-openstack-vm-attestation\2014.1.3\distribution-location.patch"
  Delete "$INSTDIR\repository\mtwilson-openstack-vm-attestation\2014.1.4\distribution-location.patch"
  Delete "$INSTDIR\repository\mtwilson-openstack-vm-attestation\2014.1.5\distribution-location.patch"
  Delete "$INSTDIR\repository\mtwilson-openstack-vm-attestation\2014.2\distribution-location.patch"
  Delete "$INSTDIR\repository\mtwilson-openstack-vm-attestation\2014.2.3\distribution-location.patch"
  Delete "$INSTDIR\repository\mtwilson-openstack-vm-attestation\2015.1.1\distribution-location.patch"
  Delete "$INSTDIR\repository\mtwilson-openstack-vm-attestation\nt_2015.1.0\distribution-location.patch"
# Delete "$INSTDIR\pre-requisites\GnuWin32-0.6.3.exe"
# Delete "$INSTDIR\pre-requisites\gawk-3.1.6-1-setup.exe"
  Delete "$INSTDIR\pre-requisites\patch-2.5.9-7-setup.exe"
  Delete "$INSTDIR\pre-requisites\Cygwin-setup-x86_64.exe"
  Delete "$INSTDIR\"
    
  Delete "$SMPROGRAMS\Openstack-extension\Uninstall.lnk"

  RMDir "$SMPROGRAMS\Openstack-extension"
  RMDir "$INSTDIR\env"
  RMDir "$INSTDIR\bin"
  RMDir "$INSTDIR\logs"
  RMDir "$INSTDIR\repository\mtwilson-openstack-policyagent-hooks\2014.1"
  RMDir "$INSTDIR\repository\mtwilson-openstack-policyagent-hooks\2014.1.3"
  RMDir "$INSTDIR\repository\mtwilson-openstack-policyagent-hooks\2014.1.4"
  RMDir "$INSTDIR\repository\mtwilson-openstack-policyagent-hooks\2014.1.5"
  RMDir "$INSTDIR\repository\mtwilson-openstack-policyagent-hooks\2014.1.5-0ubuntu1.2"
  RMDir "$INSTDIR\repository\mtwilson-openstack-policyagent-hooks\2014.2"
  RMDir "$INSTDIR\repository\mtwilson-openstack-policyagent-hooks\2014.2.3"
  RMDir "$INSTDIR\repository\mtwilson-openstack-policyagent-hooks\2014.2.4"
  RMDir "$INSTDIR\repository\mtwilson-openstack-policyagent-hooks\2015.1.1"
  RMDir "$INSTDIR\repository\mtwilson-openstack-policyagent-hooks\2015.1.2"
  RMDir "$INSTDIR\repository\mtwilson-openstack-policyagent-hooks\nt_2015.1.0"
  RMDir "$INSTDIR\repository\mtwilson-openstack-policyagent-hooks"
  RMDir "$INSTDIR\repository\mtwilson-openstack-vm-attestation\2014.1"
  RMDir "$INSTDIR\repository\mtwilson-openstack-vm-attestation\2014.1.3"
  RMDir "$INSTDIR\repository\mtwilson-openstack-vm-attestation\2014.1.4"
  RMDir "$INSTDIR\repository\mtwilson-openstack-vm-attestation\2014.1.5"
  RMDir "$INSTDIR\repository\mtwilson-openstack-vm-attestation\2014.2"
  RMDir "$INSTDIR\repository\mtwilson-openstack-vm-attestation\2014.2.3"
  RMDir "$INSTDIR\repository\mtwilson-openstack-vm-attestation\2015.1.1"
  RMDir "$INSTDIR\repository\mtwilson-openstack-vm-attestation\nt_2015.1.0"
  RMDir "$INSTDIR\repository\mtwilson-openstack-vm-attestation"
  RMDir "$INSTDIR\repository"
  RMDir "$INSTDIR\pre-requisites"
  RMDir "$INSTDIR\"

 # Remove system environment variable OPENSTACK_EXT_HOME
  DeleteRegValue ${env_hklm} OPENSTACK_EXT_HOME
  SendMessage ${HWND_BROADCAST} ${WM_WININICHANGE} 0 "STR:Environment" /TIMEOUT=5000

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  SetAutoClose true
SectionEnd
