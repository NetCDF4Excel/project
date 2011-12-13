# Install Script for NetCDF4Excel_2007

# define installer name
outFile "NetCDF4Excel_1_8_setup.exe"
 
# set ProgramFiles as default install directory
installDir $PROGRAMFILES\NetCDF4Excel
# let user choose another directory
DirText "Choose a directory"

!include "EnvVarUpdate.nsh"

LoadLanguageFile "${NSISDIR}\Contrib\Language files\English.nlf"
;--------------------------------
Name "NetCDF4Excel"

;--------------------------------
;Version Information

VIProductVersion "1.8.0.0"
VIAddVersionKey /LANG=${LANG_ENGLISH} "ProductName" "NetCDF4Excel"
VIAddVersionKey /LANG=${LANG_ENGLISH} "LegalCopyright" "Copyright 2008 - 2011 Alexander Bruhns (bruhns@free.fr)"
VIAddVersionKey /LANG=${LANG_ENGLISH} "FileDescription" "Excel 2007 Add-In for NetcDF"
VIAddVersionKey /LANG=${LANG_ENGLISH} "FileVersion" "1.8"

;--------------------------------
Page license
LicenseData "license.txt"
LicenseForceSelection checkbox
LicenseForceSelection checkbox "I accept"
;--------------------------------
Page instfiles

# default section start
section
		 
		# define output path
		setOutPath $INSTDIR
		 
		# specify file to go in output path
		file VbNc\Release\VbNc.dll
		file NetCDF4Excel_2007.xlsm
		 
		# define uninstaller name
		writeUninstaller $INSTDIR\uninstaller.exe
		
		# create shortcuts
		CreateDirectory "$SMPROGRAMS\NetCDF4Excel"
		createShortCut "$SMPROGRAMS\NetCDF4Excel\Uninstall.lnk" "$INSTDIR\uninstaller.exe"
		createShortCut "$SMPROGRAMS\NetCDF4Excel\NetCDF4Excel_2007.xlsm.lnk" "$INSTDIR\NetCDF4Excel_2007.xlsm"
		createShortCut "$DESKTOP\NetCDF4Excel_2007.xlsm.lnk" "$INSTDIR\NetCDF4Excel_2007.xlsm"
		
		# setting environment
		${EnvVarUpdate} $0 "PATH" "R" "HKLM" "$INSTDIR"
		${EnvVarUpdate} $0 "PATH" "A" "HKLM" "$INSTDIR"
		 
sectionEnd
 
 
# create a section to define what the uninstaller does.
# the section will always be named "Uninstall"
section "Uninstall"
		 
		# Always delete uninstaller first
		delete $INSTDIR\uninstaller.exe
		 
		# now delete installed file
		delete $INSTDIR\VbNc.dll
		delete $INSTDIR\NetCDF4Excel_2007.xlsm
		RMDIR $INSTDIR
		delete "$SMPROGRAMS\NetCDF4Excel\Uninstall.lnk"
		delete "$SMPROGRAMS\NetCDF4Excel\NetCDF4Excel_2007.xlsm.lnk" 
		RMDIR "$SMPROGRAMS\NetCDF4Excel"
		delete "$DESKTOP\NetCDF4Excel_2007.xlsm.lnk"
		
		${un.EnvVarUpdate} $0 "PATH" "R" "HKLM" "$INSTDIR"
		 
sectionEnd
