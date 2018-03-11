# DES-algorithm-implementation

DES is a block cipher encryption and decryption technique which works with blocks of 64 bits. We use a 64 bit block as input, also known as plain text which undergoes a series of operations to produce a 64 bit cipher text as the output. Since this is a symmetric key algorithm, the same key of length 64 bits is used for both encryption and decryption. The algorithm uses only standard arithmetic and logical operations on numbers of 64 bits at most forming the basis for encryption standards such as 2DES and 3DES. The simplicity of DES made it useful in a variety of embedded systems, smart cards, SIM cards and network devices requiring encryption like modems, set-top boxes and routers.
<br/>
<br/>
The design is implemented on Xilinx ISE using VHDL. <br/>
Design Properties<br/>
• Family : Artix 7<br/>
• Device: XC7A100T<br/>
• Package : CSG324<br/>
• Synthesis tool : XST ( VHDL/Verilog)<br/>
•Simulator : ISim (VHDL/Verilog)<br/>
<br/>
Steps to implement the code:<br/>
1.After extracting the zipfile you should see two folders which contain VHDL codes and TESTBENCHES.

2.Open Xilinx ISE > File > New Project.

3.Give a name for the project and further select the Model when prompted with specific details (We have used XC7A100T-3CSG324 with default settings).

4.Once a project is created and you are in the Design FLow tab, right click on the project model and click on Add source.

5.Navigate to the file directory where you extracted the zipfile.

6.Add all files in the folder VHDL codes and then repeat step 4 and 5 to add all testbenches.

7.The project contains top modules Encryption and Decryption, To view the RTL schematics you have to change the top module as desired.

8.For Simulation, Goto simulation tab > double click on " Simulate Behavioral Model". This generates a waveform based on the value given on the testbenches.

9.Repeat Step 8 for Decryption.

Compare that the INPUT in the encryption waveform and the OUTPUT on the Decryption waveform are the same, when, the encrypted data is given as input to the decryption program.
