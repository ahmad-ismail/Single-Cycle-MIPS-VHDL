# Project Description
Subset of single-cycle MIPS architecture in VHDL 1993 based on Harris and Harris's implementation in Digital Design & Computer Architecture (MIPS Version)
# MIPS
Implementation of a subset of MIPS computer architecture on an ALTERA DE0 Nano Board. The attached instructions perform greatest common divisor algorithm on 92 and 16.
# Install
This project uses Quartus Prime 17.0 from Intel FPGA and ALTERA DE0 Nano Board. Make sure you have the program installed on your computer and the FGPA board with its USB cable before proceeding. If you do not have the board, you can still use the project for simulation purposes.  
# Steps
1.	Download all the attached .vhd files.
2.	In your projects directory, create a new folder titled “mips”. Put the .vhd files in it.
3.	Open Quartus Prime 17.0 and click on “New Project Wizard”.
4.	Click “Next”.
5.	Choose the working directory to be “mips” and add “\quartus” to the directory address.
6.	The name of the project is “top”. Click “Next”.
7.	Choose “Empty Project”. Click “Next”.
8.	In File Name, click “…” icon. Select all the .vhd files. Click “Next”
9.	In Family, select Cyclone IV E. 
10.	In Target Device, select “Specific device selected in ‘Available devices’ list ”
11.	From “Available Devices” list, select “EP4CE22F17C6” or the model that you have.
12.	Click “Next”.
13.	In “Simulation”, for “Tool Name”, choose “ModelSim-Altera”.
14.	For “Format”, choose VHDL. Click “Next”.
15.	Click “Finish”.
16.	From “Assignments” menu, click “Pin Planner”.
17.	To each “Node” of the following, assign its respective ”Location”.
18.	 “clk”        “R8” 
19.	 “final[7]”  “L3”
20.	 “final[6]”  “B1”
21.	 “final[5]”  “F3” 
22.	 “final[4]”  “D1” 
23.	 “final[3]”  “A11” 
24.	 “final[2]” “B13” 
25.	 “final[1]”  “A13”
26.	 “final[0]”  “A15” 
27.	 “reset”      “J15” 
28.	Close “Pin Planner” window.
29.	From “Processing” menu, click “Start Compilation”.
30.	Wait until the percentage at the right bottom is 100%. 
31.	Connect the FPGA board with your computer using the USB cable. 
32.	If this is the first time to connect the FPGA board to the used computer. Perform steps 33 through 38. If not, skip them.
33.	Press start button then write “Device Manager” then open the device manager icon when it appears. 
34.	Search for the USB Blaster icon among the devices. 
35.	Right click on it then select update drivers. 
36.	Select browse my computer for driver software. 
37.	Click browse then select this location: C:\intelFPGA_lite\17.0\quartus\drivers\usb-blaster (modify 17.0 according to the version you own) 
38.	Click next and finish the setup.
39.	Return to Quartus, from “Tools” menu, choose  “Programmer”. 
40.	A new toplevel.CDF window is opened that contains the toplevel.sof file. 
41.	In the “mode” box choose “JTAG” mode. 
42.	Select “Hardware Setup” 
43.	From the “Currently Selected Hardware”, select “USB-Blaster” then click close 
44.	Check the box of Program/Configure. 
45.	Click Start button.
46.	Observe the LEDs blinking until the third LED only is on. 

