<div align="center">

# 💧 Water Reminder

![PowerShell](https://img.shields.io/badge/PowerShell-5391FE?style=for-the-badge&logo=powershell&logoColor=white)
![Windows](https://img.shields.io/badge/Windows-0078D4?style=for-the-badge&logo=windows&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

**Windows popup reminder to drink water and take breaks**

</div>

> PowerShell utility that shows a dark-themed popup window every N minutes reminding you to drink water and take a break. Configurable interval, message, and window size. Auto-starts with VS Code workspace.

---

## ✨ Features

- Customizable reminder interval (default: 40 min)
- Dark-themed WinForms popup (TopMost)
- Configurable message, title, emoji, and window size
- VS Code auto-start via tasks.json
- Counter logging in console

---

## 🚀 Quick Start

```powershell
powershell -File water-reminder.ps1                   # default: 40 min
powershell -File water-reminder.ps1 -Interval 30      # every 30 min
```

---

## 📄 License

[Maxim Osovsky](https://www.linkedin.com/in/osovsky/). Licensed under [MIT](LICENSE).
