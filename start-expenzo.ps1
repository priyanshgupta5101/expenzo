# Path to your .env.local file
$envFile = ".\.env.local"

if (Test-Path $envFile) {
    Write-Host "Loading environment variables from $envFile..."

    # Read each line and set environment variables
    Get-Content $envFile | ForEach-Object {
        if ($_ -match "^\s*#") { return }        # Skip comments
        if ($_ -match "^\s*$") { return }        # Skip empty lines
        $parts = $_ -split "=", 2
        if ($parts.Length -eq 2) {
            $name = $parts[0].Trim()
            $value = $parts[1].Trim()
            [System.Environment]::SetEnvironmentVariable($name, $value, "Process")
            Write-Host "Loaded $name"
        }
    }
} else {
    Write-Error "No .env.local file found!"
    exit 1
}

Write-Host "✅ Environment variables loaded. Starting Next.js dev server..."
npm run dev
