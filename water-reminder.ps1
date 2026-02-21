# water-reminder.ps1 — Drink water reminder for Windows
# https://github.com/maximosovsky/water-reminder
#
# Usage:
#   powershell -File water-reminder.ps1                  # default: 40 min
#   powershell -File water-reminder.ps1 -Interval 30     # every 30 min
#   powershell -File water-reminder.ps1 -Message "Stretch!" -Title "Break Time"

param(
    [int]$Interval = 40,
    [string]$Title = "Water Reminder",
    [string]$Message = "Drink a glass of water!",
    [string]$Subtitle = "Take a 10 minute break",
    [string]$Emoji = [char]::ConvertFromUtf32(0x1F4A7),
    [int]$Width = 500,
    [int]$Height = 300
)

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

function Show-Reminder {
    $form = New-Object System.Windows.Forms.Form
    $form.Text = $Title
    $form.Size = New-Object System.Drawing.Size($Width, $Height)
    $form.StartPosition = "CenterScreen"
    $form.TopMost = $true
    $form.FormBorderStyle = "FixedDialog"
    $form.MaximizeBox = $false
    $form.MinimizeBox = $false
    $form.BackColor = [System.Drawing.Color]::FromArgb(30, 30, 40)

    # Emoji icon
    $icon = New-Object System.Windows.Forms.Label
    $icon.Text = $Emoji
    $icon.Font = New-Object System.Drawing.Font("Segoe UI Emoji", 48)
    $icon.ForeColor = [System.Drawing.Color]::FromArgb(100, 180, 255)
    $icon.Size = New-Object System.Drawing.Size(($Width - 20), 80)
    $icon.Location = New-Object System.Drawing.Point(10, 15)
    $icon.TextAlign = "MiddleCenter"
    $form.Controls.Add($icon)

    # Main message
    $label = New-Object System.Windows.Forms.Label
    $label.Text = $Message
    $label.Font = New-Object System.Drawing.Font("Segoe UI", 20, [System.Drawing.FontStyle]::Bold)
    $label.ForeColor = [System.Drawing.Color]::White
    $label.Size = New-Object System.Drawing.Size(($Width - 20), 45)
    $label.Location = New-Object System.Drawing.Point(10, 100)
    $label.TextAlign = "MiddleCenter"
    $form.Controls.Add($label)

    # Subtitle
    $sub = New-Object System.Windows.Forms.Label
    $sub.Text = $Subtitle
    $sub.Font = New-Object System.Drawing.Font("Segoe UI", 13)
    $sub.ForeColor = [System.Drawing.Color]::FromArgb(160, 160, 180)
    $sub.Size = New-Object System.Drawing.Size(($Width - 20), 30)
    $sub.Location = New-Object System.Drawing.Point(10, 145)
    $sub.TextAlign = "MiddleCenter"
    $form.Controls.Add($sub)

    # OK button
    $btn = New-Object System.Windows.Forms.Button
    $btn.Text = "OK"
    $btn.Font = New-Object System.Drawing.Font("Segoe UI", 12)
    $btn.Size = New-Object System.Drawing.Size(120, 40)
    $btn.Location = New-Object System.Drawing.Point((($Width - 120) / 2), ($Height - 100))
    $btn.FlatStyle = "Flat"
    $btn.BackColor = [System.Drawing.Color]::FromArgb(100, 180, 255)
    $btn.ForeColor = [System.Drawing.Color]::White
    $btn.FlatAppearance.BorderSize = 0
    $btn.Add_Click({ $form.Close() })
    $form.Controls.Add($btn)

    $form.AcceptButton = $btn
    $form.Add_Shown({ $form.Activate() })
    $form.ShowDialog() | Out-Null
    $form.Dispose()
}

# Main loop
Write-Host ""
Write-Host "  Water Reminder v1.0"
Write-Host "  Interval: every $Interval minutes"
Write-Host "  Press Ctrl+C to stop"
Write-Host ""

$count = 0
while ($true) {
    Start-Sleep -Seconds ($Interval * 60)
    $count++
    $time = Get-Date -Format "HH:mm"
    Write-Host "[$time] Reminder #$count"
    Show-Reminder
}
