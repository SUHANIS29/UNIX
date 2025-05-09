# SJF Non-Preemptive Scheduling with Average TAT and WT

# Step 1: Define process list [PID, AT, BT]
processes = [
    [1, 0, 6],
    [2, 1, 8],
    [3, 2, 7],
    [4, 3, 3]
]

# Step 2: Sort by Arrival Time first, then by Burst Time
processes.sort(key=lambda x: (x[1], x[2]))

n = len(processes)
completed = []
time = 0  # current time

# Step 3: Scheduling
while processes:
    ready = [p for p in processes if p[1] <= time]

    if ready:
        # Choose the process with the shortest burst time
        shortest = min(ready, key=lambda x: x[2])
        processes.remove(shortest)
        
        pid, at, bt = shortest
        start = time
        time += bt  # Completion time after executing
        ct = time
        tat = ct - at
        wt = tat - bt
        
        completed.append([pid, at, bt, ct, tat, wt])
    else:
        time += 1  # CPU is idle

# Step 4: Display table and calculate averages
print("PID\tAT\tBT\tCT\tTAT\tWT")
total_tat = 0
total_wt = 0
for p in sorted(completed):
    print("\t".join(map(str, p)))
    total_tat += p[4]  # TAT
    total_wt += p[5]  # WT

# Step 5: Print averages
avg_tat = total_tat / n
avg_wt = total_wt / n
print(f"\nAverage Turnaround Time = {avg_tat:.2f}")
print(f"Average Waiting Time    = {avg_wt:.2f}")
