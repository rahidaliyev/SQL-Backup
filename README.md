# MSSQL Daily Backup Script

This project automates daily backups for all databases in an MSSQL server. The backup process creates a separate folder for each run, named by the current date and time, inside a specified directory.

## Prerequisites

- MSSQL Server installed and running
- Windows environment
- Sufficient disk space in `D:\BackupFolder` (or the location specified in the script)

## Usage

To automate backups, follow these steps:

### 1. **Place Your `.bat` File**

Ensure your batch script (`.bat`) is configured correctly and placed in an accessible directory. The script should:

- Create a folder with the current date and time as the name.
- Store backups for each database in that folder.
- Use `sqlcmd` to back up all databases in the SQL Server instance.

### 2. **Configure Windows Task Scheduler**

To run the backup automatically on a daily schedule, set up the batch file in Windows Task Scheduler:

1. **Open Task Scheduler**:
   - Search for **Task Scheduler** in the Windows search bar and open it.

2. **Create a New Task**:
   - Click **Create Task** from the right-hand pane.

3. **General Settings**:
   - Name the task (e.g., `MSSQL Daily Backup`).
   - Select the option **Run whether user is logged on or not** for background execution.
   - Choose **Do not store password** if applicable for security.

4. **Triggers**:
   - Go to the **Triggers** tab and click **New**.
   - Set the trigger to run **daily** at your preferred time.
   - Click **OK**.

5. **Actions**:
   - Go to the **Actions** tab and click **New**.
   - In the **Action** dropdown, select **Start a program**.
   - Click **Browse** and select your `.bat` file.
   - Click **OK**.

6. **Conditions & Settings**:
   - In the **Conditions** tab, uncheck **Start the task only if the computer is on AC power** (optional based on your environment).
   - In the **Settings** tab, check **Allow task to be run on demand** and **If the task fails, restart every** (optional).
   - Click **OK** to save.

7. **Task Completion**:
   - After setting up the task, it will run automatically at the scheduled time.

### 3. **Verify Backup Process**

Once the task runs successfully, verify that a new folder is created under the backup directory (e.g., `D:\BackupFolder\`) with the format:

```
D:\BackupFolder\YYYYMMDD_HHMMSS\
```

Each folder will contain backup files for all databases in the SQL Server instance.

## Customization

- **Backup directory**: You can modify your `.bat` script to change the backup location or folder naming convention.
- **Scheduling frequency**: Adjust the task in Task Scheduler to run at a different interval (e.g., hourly, weekly).
- **Backup retention**: Optionally, add logic to your `.bat` script to delete old backups after a set number of days.

## License

This project is licensed under the MIT License.

---

This `README.md` is designed for easy integration and documentation of your existing script. Let me know if you need further adjustments!
