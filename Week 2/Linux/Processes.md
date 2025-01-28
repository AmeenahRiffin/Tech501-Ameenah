# Processes

- [Processes](#processes)
    - [What is a Process?](#what-is-a-process)
  - [Commands](#commands)
      - [How to list processes](#how-to-list-processes)
    - [How to list all processes (with more info)](#how-to-list-all-processes-with-more-info)
    - [How to kill a process](#how-to-kill-a-process)
    - [How to run a process in the background](#how-to-run-a-process-in-the-background)
    - [How to change process priority](#how-to-change-process-priority)
    - [Zombie processes](#zombie-processes)
      - [Characteristics of zombie processes:](#characteristics-of-zombie-processes)
      - [How to find zombie processes:](#how-to-find-zombie-processes)
      - [How to clean up zombie processes:](#how-to-clean-up-zombie-processes)
  - [PM2](#pm2)

### What is a Process?
A process is a running instance of a program. It is an active program that is currently being executed by the computer's operating system. 

## Commands

#### How to list processes
```
ps          # Shows processes for current terminal
ps -e       # Shows all processes on the system
ps -f       # Shows processes with full format listing
```

### How to list all processes (with more info)
```
ps aux      # Shows all processes with CPU/memory usage
ps -ef      # Full format listing of all processes
top         # Interactive process viewer, updates in real-time
htop        # Enhanced interactive process viewer (if installed)
```

### How to kill a process
```
kill -1 <process_id>    # Hangup (SIGHUP) - gentlest version
kill -2 <process_id>    # Interrupt (SIGINT) - same as Ctrl+C
kill -9 <process_id>    # Force kill (SIGKILL) - use as last resort, as this may create zombie processes and cause data loss
kill -15 <process_id>   # Terminate gracefully (SIGTERM) - default
killall <process_name>  # Kill all processes with given name
```

### How to run a process in the background
```
command &               # Run command in background
sleep 100 &            # Example: sleep for 100 seconds in background
nohup command &        # Run command immune to hangups
bg                     # Send current process to background
fg                     # Bring background process to foreground
jobs                   # List background jobs

```
### How to change process priority
```
nice -n 10 command     # Start command with lower priority (nice value)
renice 10 -p <pid>     # Change priority of running process
```

### Zombie processes

A zombie process is a process that has completed execution but still has an entry in the process table. This happens when a child process finishes but its parent process hasn't read its exit status yet.

#### Characteristics of zombie processes:
- Cannot be killed with SIGKILL
- Take up minimal system resources
- Indicated by 'Z' state in process listing
- Only removed when parent process reads exit status

#### How to find zombie processes:

```
ps aux | grep 'Z'    # List zombie processes
```

#### How to clean up zombie processes:
- Kill or restart the parent process
- Use wait() system call in parent process to collect child status
- Ensure proper process management in applications


## PM2



IE:  
```
pm2 start app.js
```
