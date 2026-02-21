# Architecture — water-reminder

## Overview

water-reminder — PowerShell-утилита для Windows. Показывает всплывающее окно-напоминание каждые N минут с просьбой выпить стакан воды и сделать перерыв.

## Tech Stack

| Layer | Technology |
|-------|-----------|
| Language | PowerShell |
| GUI | System.Windows.Forms |
| Graphics | System.Drawing |

## Project Structure

```
├── water-reminder.ps1    # Единственный скрипт — GUI + main loop
├── README.md             # Документация + скриншот
├── screenshot.jpg        # Скриншот окна
└── LICENSE               # MIT
```

## Usage

```powershell
powershell -File water-reminder.ps1                  # default: 40 min
powershell -File water-reminder.ps1 -Interval 30     # every 30 min
powershell -File water-reminder.ps1 -Message "Stretch!" -Title "Break Time"
```

## Parameters

| Param | Default | Description |
|-------|---------|-------------|
| `-Interval` | 40 | Минуты между напоминаниями |
| `-Title` | "Water Reminder" | Заголовок окна |
| `-Message` | "Drink a glass of water!" | Текст |
| `-Subtitle` | "Take a 10 minute break" | Подтекст |
| `-Emoji` | 💧 | Эмодзи |
| `-Width` | 500 | Ширина окна |
| `-Height` | 300 | Высота окна |

## VS Code Integration

Автозапуск при открытии workspace через `.vscode/tasks.json`:

```json
{
    "label": "Water Reminder",
    "type": "shell",
    "command": "powershell -File C:\\100star\\water-reminder\\water-reminder.ps1",
    "presentation": { "reveal": "silent", "panel": "dedicated", "close": false },
    "isBackground": true,
    "problemMatcher": [],
    "runOptions": { "runOn": "folderOpen" }
}
```

**Активация (одноразово):** `Ctrl+Shift+P` → `Tasks: Manage Automatic Tasks in Folder` → **Allow Automatic Tasks in Folder**.

## Key Concepts

- **WinForms GUI** — dark-themed popup (30,30,40 bg, blue accent)
- **Infinite loop** — `while ($true)` с `Start-Sleep`
- **TopMost** — окно всегда поверх всех
- **Counter** — логирует номер каждого напоминания в консоль
