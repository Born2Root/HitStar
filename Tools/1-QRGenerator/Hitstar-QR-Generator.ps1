######################################
#
# ************************************
# Powershell QR-Code-Generator Script 
# ************************************
# 
# Purpose: Genrates QR-Codes for the Hitstar game.
#
# Usage:
#		provide a input.txt (UTF-8 encoded) in the same folder where the script is saved.
#		Run the powershell script.
#		The genrated QR-Code pictures are saved in subfolders of the script folder
#
# About the script itself:
#		The input.txt contains per line the path of all the .mp3 files
#		Example string: Summer\SNAP! - The Power.mp3
#		The script removes the .mp3 ending and uses the following strings:
#			Subfolder for the generated QR-Code pictures: Summer\
#			QR-Code picture name: SNAP! - The Power.png
#			QR-Code encoded content: Summer\SNAP! - The Power 
#			(the audio file ending, like .mp3 is added later on in the mobile app. This way the printed cards are more flexible regarding possible future different audio file-formats)
#
######################################

# Get the folder where the script is located
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# Define paths
$inputFile = Join-Path $scriptDir "input.txt"
$outputRoot = Join-Path $scriptDir "QR_Output"
$exePath = Join-Path $scriptDir "SimpleCodeGenerator.exe"

# Read lines (UTF-8, non-empty)
$lines = Get-Content -Path $inputFile -Encoding UTF8 | Where-Object { -not [string]::IsNullOrWhiteSpace($_) }
$total = $lines.Count
$index = 0

foreach ($line in $lines) {
    $index++
    $cleanLine = $line.Trim()

    # Split on backslash
    $parts = $cleanLine -split "\\"

    if ($parts.Count -eq 2) {
        $category = $parts[0].Trim()
        $filenameWithExt = $parts[1].Trim()

        # Remove .mp3 extension
        $filenameNoExt = [System.IO.Path]::GetFileNameWithoutExtension($filenameWithExt)

        # Clean filename for Windows
        $safeFilename = [RegEx]::Replace($filenameNoExt, '[\\/:*?"<>|]', '')

        # Prepare QR content with forward slash
        $qrContent = "$category/$filenameNoExt"

        # Prepare category subfolder path
        $categoryFolder = Join-Path $outputRoot $category

        # Create subfolder if needed
        if (!(Test-Path $categoryFolder)) {
            New-Item -ItemType Directory -Path $categoryFolder | Out-Null
        }

        # Final PNG path
        $outputPath = Join-Path $categoryFolder "$safeFilename.png"

        # Console output
        Write-Host "[$index/$total] Generating QR: $qrContent -> $category\$safeFilename.png"

        # Run QR generator
        Start-Process -NoNewWindow -FilePath $exePath -ArgumentList "/ErrorCorrection 4 /MinVersion 10 /MaxVersion 40 /Save `"$qrContent`" `"$outputPath`" 10" -Wait
    } else {
        Write-Host "[$index/$total] Skipping invalid line: $cleanLine"
    }
}

Write-Host "`n✅ QR Code generation complete! Check the folder: $outputRoot"
