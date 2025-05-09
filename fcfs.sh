class process:  
  def_init_(self,id,at,bt,ct):
	self.id=id
	self.at=at
	self.bt=bt
	self.ct=ct
	self.tat=self.ct-self.at
	self.wt=self.tat-self.bt

   def get(self):
	print(f"{self.id}\t{self.at}\t{self.bt}\t{self.ct}\t{self.tat}\t{self.wt}")
   def ta(self):
	return self.tat
   def wat(self):
	return self.wt

num=int(input("enter no of process:"))
l=[]
ct=0
for i in range(num):
	print("process{i+1}")
	at=int(input("arrival time:"))
	bt=int(input("burst time:"))
	if(len(l)==0):
	ct=bt
	l.append(process(i,at,bt,ct))
	else:
	ct+=bt
	l.append(process(i,at,bt,ct))
	print("\n")
avg_tat=0
avg_wt=0
print("PID\tAT\tBT\tCT\tTAT\tWT")
for process in l:
	process.get()
for process in l:
	avg_tat+=process.ta()
	avg_wt+=process.wat()
print("avg_tat:{avg_tat/num}\n avg_wt={avg_wt/num}")
