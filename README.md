# 🐧 Terminal-Based Linux Admin Dashboard

A clean and interactive **Linux Administration Dashboard** built with **Bash scripting**.
The project provides a terminal-based interface for viewing system information, managing users and groups, creating reports, and performing common Linux administration tasks.

---

## 🚀 Features

The dashboard includes several useful Linux administration tools:

* 🖥️ **System Information**

  * Current user
  * Hostname
  * Current working directory
  * System date and time
  * Disk usage

* 👥 **Users & Groups**

  * Display all users
  * Display all groups
  * Search for a specific user

* 📊 **Reports**

  * Store generated system reports inside the `reports` directory

* 💾 **Backups**

  * Store backup files inside the `backups` directory

* 📋 **Interactive Menu**

  * Simple terminal navigation
  * User-friendly numbered options
  * Pause functionality between operations

* 🧹 **Clean Terminal Interface**

  * Uses `clear` to keep the dashboard organized and readable

---

## 🛠️ Technologies Used

![Bash](https://img.shields.io/badge/Bash-Scripting-4EAA25?style=for-the-badge\&logo=gnu-bash\&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-Operating%20System-FCC624?style=for-the-badge\&logo=linux\&logoColor=black)

The project mainly uses:

* 🐚 Bash
* 🐧 Linux
* 📁 File and directory commands
* 👤 User and group commands
* 💽 Disk management commands
* 🔎 Text searching commands

---

## 📁 Project Structure

```text
linux-admin-dashboard/
│
├── 📄 dashboard.sh
├── 📂 reports/
├── 📂 backups/
└── 📄 README.md
```

The following directories are automatically created when the script starts:

```bash
mkdir -p reports
mkdir -p backups
```

---

## ⚙️ Requirements

Before running the project, make sure you have:

* 🐧 A Linux-based operating system
* 🐚 Bash shell
* 💻 Terminal access

The script uses common Linux commands such as:

```bash
whoami
hostname
pwd
date
df
grep
```

---

## ▶️ Getting Started

### 1️⃣ Clone the Repository

```bash
git clone <your-repository-url>
```

Then enter the project directory:

```bash
cd linux-admin-dashboard
```

### 2️⃣ Give the Script Execute Permission

```bash
chmod +x dashboard.sh
```

### 3️⃣ Run the Dashboard

```bash
./dashboard.sh
```

You can also run it directly with Bash:

```bash
bash dashboard.sh
```

---

## 🖥️ Example Output

```text
==================================
     Linux Admin Dashboard
==================================

1. System Information
2. Users and Groups
3. Reports
4. Backups
5. Exit

Choose an option:
```

Example system information:

```text
===== System Information =====

Current User:
mohammed

Hostname:
linux-pc

Current Directory:
/home/mohammed

Date:
Thu Aug 27 01:30:00 PM IDT 2026

Disk Usage:
Filesystem      Size  Used Avail Use% Mounted on
...
```

---

## 🧩 Main Functions

### ⏸️ `pause()`

Pauses the program until the user presses **Enter**.

```bash
pause() {
    echo
    read -r -p "Press Enter to continue..."
}
```

---

### 🖥️ `system_info()`

Displays important system information including:

* 👤 Current logged-in user
* 🖥️ Hostname
* 📂 Current directory
* 📅 Current date and time
* 💽 Disk usage

---

### 👥 `users_info()`

Provides options for working with Linux users and groups.

```text
===== Users and Groups =====

1. Show all users
2. Show all groups
3. Search for user
```

This section can be used to quickly inspect user and group information directly from the terminal.

---

## 📚 Bash Concepts Practiced

This project demonstrates several fundamental Bash scripting concepts:

* 🔹 Variables
* 🔹 Functions
* 🔹 `while` loops
* 🔹 `if` statements
* 🔹 `case` statements
* 🔹 User input using `read`
* 🔹 Exit status using `$?`
* 🔹 File and directory management
* 🔹 Linux users and groups
* 🔹 Command output
* 🔹 Terminal menu navigation

---

## 🎯 Project Purpose

The goal of this project is to combine different Linux commands and Bash scripting concepts into one practical terminal application.

It provides hands-on practice with:

* Linux administration
* Bash scripting
* Terminal commands
* User interaction
* System monitoring
* Basic file management

---

## 🔮 Future Improvements

Possible improvements include:

* 📈 CPU and memory monitoring
* 🌐 Network information
* 📦 Installed package management
* 🔄 Service management
* 📝 Automatic report generation
* 💾 Advanced backup options
* 🔐 Permission management
* 📊 System statistics

---

## 👨‍💻 Author

**Mohammed Alqerem**

🎓 Computer Science Student
🐧 Learning Linux & Bash Scripting
💻 Interested in Software Development and System Administration

---

## ⭐ Support

If you find this project useful, consider giving the repository a **⭐ Star**.

> Built with 🐧 Linux and ❤️ Bash.
