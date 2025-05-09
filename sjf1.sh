def sjf(processes):
    time = 0
    done = []
    gantt = []

    while processes:
        
        ready = []
        for p in processes:
            if p[1] <= time:
                ready.append(p)

        if not ready:
            gantt.append("Idle")
            time += 1
            continue

        
        shortest = ready[0]
        for p in ready:
            if p[0] < shortest[0]:
                shortest = p

        bt, at, pid = shortest
        time += bt
        ct = time
        tat = ct - at
        wt = tat - bt
        done.append([pid, ct, tat, wt])
        gantt.append(pid)
        processes.remove(shortest)

    # Output
    print("\nGantt Chart:")
    print(" → ".join(gantt))

    print("\nPID\tCT\tTAT\tWT")
    total_tat = 0
    total_wt = 0
    for d in done:
        print(f"{d[0]}\t{d[1]}\t{d[2]}\t{d[3]}")
        total_tat += d[2]
        total_wt += d[3]

    n = len(done)
    print(f"\nAverage TAT: {total_tat / n:.2f}")
    print(f"Average WT : {total_wt / n:.2f}")

# === Main ===
plist = []
n = int(input("Enter number of processes: "))

for i in range(n):
    bt = int(input(f"Enter Burst Time for P{i+1}: "))
    at = int(input(f"Enter Arrival Time for P{i+1}: "))
    plist.append([bt, at, f"P{i+1}"])

sjf(plist)
